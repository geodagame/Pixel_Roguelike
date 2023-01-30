extends Node2D
#
# Autoload con algunso cheats para debuging
#


# ---- Variables

var _player 
onready var _player_spawn
onready var _container_doors = GameManager.current_room.get_node("Doors")

# ---- Funciones

func _ready():
	if GameManager.current_room.get_node("PlayerSpawn"):
		_player_spawn = GameManager.current_room.get_node("PlayerSpawn")


func _process(_delta):
	
	#---------------
	#DevOnly Section
	#---------------
	
	if Input.is_action_just_pressed("ui_accept"):
		#DevOnly: Inicia el juego
		if GameManager.game_has_started == false:
			GameManager.create_player(GameManager.current_room)
			if _player_spawn: #Evita que crashee si no hay PlayerSpawn
				# --- Debug ---
				print("Creando Player")
				if _player: print("Instancia de Player Cargada")
				print("Posición de Spawn: " + str(_player_spawn.position))
				# ---- #
				_player.position = _player_spawn.position
			#current_room._initialize_room();
			GameManager.game_has_started = true
	
	
	if Input.is_action_just_pressed("DevOnly_OpenDoors"):
		#F1: Fuerza la apertura de todas las puertas
		for door in _container_doors.get_children():
			door.open()
	
	
	if Input.is_action_just_pressed("DevOnly_CloseDoors"):
		#F2: Fuerza el cierre de todas las puertas
		for door in _container_doors.get_children():
			door.close()
		
		
	if Input.is_action_just_pressed("DevOnly_FullHeal"):
		#F4: Cura completamente al jugador
		PlayerManager.heal_player(PlayerManager.max_health)
		print("Jugador curado: " + PlayerManager.health)
		

