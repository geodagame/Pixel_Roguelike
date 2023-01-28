extends Node2D

var enemy_data = {"enemy" : preload("res://Scenes/Enemies/enemy.tscn")}
var num_enemies
onready var _container_doors = $Doors
onready var _container_enemy_position = $EnemyPosition
onready var _player_detector = $PlayerDetector

func _ready():
	# Cuenta la cantidad de Position2D en EnemyPosition
	num_enemies = _container_enemy_position.get_child_count();


func _on_enemy_killed():
	# Lleva registro de la cantidad de enemigos vivos.
	num_enemies -= 1
	if num_enemies <= 0:
		# Si no hay más enemigos, abre la puerta.
		for door in _container_doors.get_children():
			door.open()


func _spawn_monsters():
	# Coloca un enemigo en cada Position2D
	for enemy_position in _container_enemy_position.get_children():
		var enemy = enemy_data["enemy"].instance()
		enemy.connect("tree_exited", self, "_on_enemy_killed")
		enemy.position = enemy_position.position
		call_deferred("add_child", enemy)


func _initialize_room():
	# Inicializa la habitación.
	_player_detector.queue_free()
	_spawn_monsters()
	for door in _container_doors.get_children():
		door.close();


func _on_PlayerDetector_body_entered(body):
	if GameManager.player_exists == false: return 
	if body == GameManager.get_player_node("RoomScript"):
		_initialize_room()


#---------------------------------------------------

