extends KinematicBody2D
class_name Enemy, "res://Sprites/Enemies/Enemy.png"

# ---- Variables

	# Movimiento
#const FRICTION = 0.15
#export(int) var acceleration = 10
#export(int) var max_speed = 50
#var mov_direction = Vector2.ZERO
#var velocidad = Vector2.ZERO

	# Stats
export var max_health = 1
export var attack_value = 2
export var defense_value = 1
var health = max_health


	# Attack IA
export(String) var _enemy_class = "Basic"
export var _enemy_pattern = "Basic"


	# Pathfinding
var path = [];
var _path_to_player


	# Nodos hijos y padres
onready var parent = get_parent()
onready var state_machine = $State_Machine
onready var timer = $PathTimer
onready var _agent = $NavigationAgent2D
onready var _player_path = get_node(_path_to_player)
var _player = null

#func _ready():
#	pass
# ---- Estados

#func chase():
#	# Función básica de persecución
#	if GameManager.player_exists:
#		# -- Debug --
#		print("Chase Working") 
#		print(_player_path.global_position)
#		print(_player_path.position)
#		# ----
#		var target = _player_path.position
#		_agent.set_target_location(target)
#		_agent.get_next_location()
#		_line.points = _agent.get_nav_path()
		
		
		


# ---- Estados

func chase():
	# Función básica de persecución
	_agent.set_target_location(_player_path.global_position)


# ---- Movimiento

#func _physics_process(_delta):
	#Pathfinding
#	if _agent.is_navigation_finished():
#		print("Debug: Navigation Finished of " + str(self))
#		return
	
#	if Input.is_mouse_button_pressed(1):
#		_agent.set_target_location(GameManager.get_player_node("Enemy").global_position)
		#_agent.set_target_location(get_global_mouse_position())
#	var current_position = position
#	var target = _agent.get_next_location()
#	print(target)
#	mov_direction = current_position.direction_to(target)
#	pass

func move():
	#Actualiza la velocidad
#	mov_direction = mov_direction.normalized()
#	velocidad += mov_direction * (acceleration * 0.5)
#	velocidad.limit_length(max_speed)
#	_agent.set_velocity(velocidad)

#func _on_NavigationAgent2D_velocity_computed(safe_velocity):
#	velocidad = move_and_slide(safe_velocity)
#	velocidad = lerp(velocidad, Vector2.ZERO, FRICTION) #Reduce velocidad
	pass	
# ---- Pathfinding

func _on_PathTimer_timeout():
	#chase()
	pass

# ---- Ataques y patrones

func _on_Hurtbox_area_entered(_area):
	health -= _player.player_attack
	if health <= 0:
		queue_free()


func _on_PlayerDetector_body_entered(body):
	_player = body


func _on_Hitbox_area_entered(_area):
	PlayerManager.damage_player(attack_value)
	PlayerManager.add_knokback(velocity)
	

	# Movimiento
const FRICTION = 0.15
export(int) var speed = 10
export(int) var _max_speed = 50
var mov_direction = Vector2.ZERO
var velocity = Vector2.ZERO

onready var nav_agent = $Node2D/NavigationAgent2D



func _ready():
	
	nav_agent.set_target_location(global_position)
	print(nav_agent.get_next_location())
	print("Final Location")
	print(nav_agent.get_final_location())
		
	#if GameManager.player_exists:
	#	_player = GameManager.get_player_node("Enemy")
	#	print("Player Spotted by enemy")
	#	print(_player)
	#	_path_to_player = self.get_path_to(_player)
	#	_player_path = get_node(_path_to_player)
	#	print(_path_to_player)
	#	print(_player_path)

func _physics_process(delta):
	if Input.is_mouse_button_pressed(1):
		nav_agent.set_target_location(get_global_mouse_position())
		print()
	var next_loc = nav_agent.get_next_location()
	#print($NavigationAgent2D.get_next_location())
	velocity = position.direction_to(next_loc) * speed
	velocity = move_and_slide(velocity)
	
#func _set_navigation():
	#set_target_location()

func _on_NavigationAgent2D_velocity_computed(safe_velocity):
	velocity = move_and_slide(safe_velocity)
