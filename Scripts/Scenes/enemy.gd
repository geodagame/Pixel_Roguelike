class_name Enemy, "res://Sprites/Enemies/Enemy.png"
extends KinematicBody2D
#
# Main Enemy Script
#

# ---- Variables

	# Movimiento
const FRICTION = 0.15
export(int) var acceleration = 10
export(int) var max_speed = 50
var mov_direction = Vector2.ZERO
var velocity = Vector2.ZERO
	# Stats
export var max_health = 1
export var attack_value = 2
export var defense_value = 1
var health = max_health
	# Attack IA
export(String) var _enemy_class = "Basic"
export var _enemy_pattern = "Basic"
	# Pathfinding
var next_point_vector
var next_point_distance
var _path_to_player
	# Nodos hijos y padres
onready var parent = get_parent()
onready var state_machine = $State_Machine
onready var timer = $PathTimer
onready var _agent = $NavigationAgent2D

# ---- Built-in

func _ready():
	set_new_path()


func _physics_process(_delta):
	#Pathfinding

	var current_position = global_position
	#print(current_position)
	var target = _agent.get_next_location()
	#print(target)
	mov_direction = current_position.direction_to(target)
	if current_position.distance_to(_path_to_player[0]) < 2:
		_path_to_player.remove(0)
		if _path_to_player.size():
			_agent.set_target_location(_path_to_player[0])
		else:
			set_new_path()

# ---- Movimiento

func move():
	#Actualiza la velocidad
	mov_direction = mov_direction.normalized()
	velocity += mov_direction * (acceleration * 0.5)
	velocity.limit_length(max_speed)
	_agent.set_velocity(velocity)


func _on_NavigationAgent2D_velocity_computed(safe_velocity):
	velocity = move_and_slide(safe_velocity)
	velocity = lerp(velocity, Vector2.ZERO, FRICTION) #Reduce velocidad

# ---- Pathfinding

func set_new_path():
	_path_to_player = 0
	_path_to_player = Navigation2DServer.map_get_path(_agent.get_navigation_map(), global_position, GameManager.get_player_node("Enemy").global_position, true)
	_path_to_player.remove(0)
	next_point_vector = _path_to_player[0]
	_agent.set_target_location(next_point_vector)


func _on_PathTimer_timeout():
	#chase()
	#set_new_path()
	pass

# ---- Ataques y patrones

func _on_Hurtbox_area_entered(_area):
	health -= PlayerManager.player_attack
	if health <= 0:
		queue_free()


func _on_Hitbox_area_entered(_area):
	PlayerManager.damage_player(attack_value)
	PlayerManager.add_knokback(velocity)
	
