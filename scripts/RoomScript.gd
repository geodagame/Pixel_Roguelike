extends Node2D

var enemy_data = {"Enemy" : preload("res://Scenes/Enemies/TestEnemy.tscn")}
var num_enemies

onready var _container_doors = $Doors
onready var _container_enemyPosition = $EnemyPosition
onready var playerDetector = $PlayerDetector
<<<<<<< HEAD
=======
<<<<<<< HEAD

onready var player = $Player
>>>>>>> 7309ae50f6f9771626ed95d1016a63448d9e05fd
 




=======
onready var player = $Player
 
>>>>>>> 09cf448c412e8bbec4737be44bcd28b1246a4f45
func _ready():
	# Cuenta la cantidad de Position2D en EnemyPosition
	
	num_enemies = _container_enemyPosition.get_child_count();
	
func _on_enemy_killed():
	# Lleva registro de la cantidad de enemigos vivos.
	
	num_enemies -= 1
	if num_enemies <= 0:
		# Si no hay más enemigos, abre la puerta.
		
		for door in _container_doors.get_children():
			door.open()

func _spawn_monsters():
	# Coloca un enemigo en cada Position2D
	
	for enemyPosition in _container_enemyPosition.get_children():
		var enemy = enemy_data["Enemy"].instance()
		
		enemy.connect("tree_exited", self, "on_enemy_killed")
		enemy.position = enemyPosition.position
		call_deferred("add_child", enemy)
		

func _initialize_room():
	# Inicializa la habitación.
	
	playerDetector.queue_free()
	_spawn_monsters()
	for door in _container_doors.get_children():
		door.close();
		
# warning-ignore:unused_argument
<<<<<<< HEAD
func _on_PlayerDetector_area_entered(area):
	_initialize_room()


=======
>>>>>>> 09cf448c412e8bbec4737be44bcd28b1246a4f45
func _on_PlayerDetector_body_entered(body):
	if GameManager.player_exists == false: return 
	if body == GameManager.get_player_node("RoomScript"):
		_initialize_room()
<<<<<<< HEAD

#---------------------------------------------------
=======
>>>>>>> 09cf448c412e8bbec4737be44bcd28b1246a4f45
