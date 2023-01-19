extends Node2D

# ---- Variables

	# Hijos
onready var current_room = get_tree().current_scene.get_node("MainRoom")
onready var _container_doors = current_room.get_node("Doors")
onready var player_spawn

	# Controladores
var _player 

# ---- Funciones

func _ready():
	if current_room.get_node("PlayerSpawn"):
		player_spawn = current_room.get_node("PlayerSpawn")

func _process(_delta):
	
	#---------------
	#DevOnly Section
	#---------------
	if Input.is_action_just_pressed("ui_accept"):
		#DevOnly: Inicia el juego
		if GameManager.game_has_started == false:
			GameManager.create_player(current_room)
			if player_spawn: #Evita que crashee si no hay PlayerSpawn
				# --- Debug ---
				print("Creando Player")
				if _player: print("Instancia de Player Cargada")
				print("Posición de Spawn: " + str(player_spawn.position))
				# ---- #
				
				_player.position = player_spawn.position
				
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
