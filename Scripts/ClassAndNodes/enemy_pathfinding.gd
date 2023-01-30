class_name EnemyPathfinding
extends Node
#
# Nodo que contiene funciones útiles para el pathfinding
#

	# Pathfinding
var next_point_vector
var next_point_distance
var _path_to_player = [null]
var _path_copy
onready var _parent = get_parent()
onready var _nav_agent = _parent.get_node("NavigationAgent2D")
onready var _player = GameManager.get_player_node("EnemyPathfinding")

func _ready():
	pass

func _physics_process(delta):
		#Pathfinding
	if not _path_to_player.size():
		create_new_path()
	var current_position = _parent.global_position
	var target = _nav_agent.get_next_location()
	_parent.mov_direction = current_position.direction_to(target)
	
	if current_position.distance_to(_path_to_player[0]) < 2:
		_path_to_player.remove(0)
		if not _path_to_player.empty():
			_nav_agent.set_target_location(_path_to_player[0])
		else:
			print("Pathfinding")
			create_new_path()


func create_new_path():
	_path_to_player = null
	_path_to_player = Navigation2DServer.map_get_path(_nav_agent.get_navigation_map(), _parent.global_position, GameManager.get_player_node("EnemyPathfinding").global_position, true)
	_path_copy = _path_to_player
	_path_to_player.remove(0)
	next_point_vector = _path_to_player[0]
	if _path_to_player.size() >= 2:
		var _player_pos = _player.global_position
		var _half_point_to_player = _path_to_player[_path_to_player.size() / 2].distance_to(_player_pos)
		var _first_point_to_player = _path_to_player[0].distance_to(_player_pos)
		if _half_point_to_player >= _first_point_to_player:
			_path_to_player.resize(1)
			return
	_nav_agent.set_target_location(next_point_vector)

