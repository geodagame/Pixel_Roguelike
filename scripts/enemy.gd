extends KinematicBody2D
class_name Enemy, "res://Sprites/Enemies/Enemy.png"

# ---- Variables

	# Movimiento
const FRICTION = 0.15
export(int) var acceleration = 10
export(int) var max_speed = 50
var mov_direction = Vector2.ZERO
var velocidad = Vector2.ZERO

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
export var _path_to_player := NodePath()

	# Nodos hijos y padres
onready var parent = get_parent()
onready var state_machine = $State_Machine
onready var timer = $PathTimer
onready var _agent = $NavigationAgent2D
onready var _player_path = get_node(_path_to_player)
onready var _player = get_tree().current_scene.get_node("Player")


# ---- Estados

func chase():
	# Función básica de persecución
	if _player:
		_agent.set_target_location(_player_path.global_position)
	

# ---- Movimiento

func _physics_process(_delta):
	#Pathfinding
	if _agent.is_navigation_finished():
		return
	mov_direction = global_position.direction_to(_agent.get_next_location())
	
	velocidad = move_and_slide(velocidad)
	velocidad = lerp(velocidad, Vector2.ZERO, FRICTION) #Reduce velocidad

func move():
	#Actualiza la velocidad
	mov_direction = mov_direction.normalized()
	velocidad += mov_direction * acceleration
	velocidad.limit_length(max_speed)

func _on_NavigationAgent2D_velocity_computed(safe_velocity):
	# Move_and_slide no funciona fuera de _physics_process xd
	velocidad = move_and_slide(safe_velocity)
	velocidad = lerp(velocidad, Vector2.ZERO, FRICTION) #Reduce velocidad
# ---- Pathfinding

func _on_PathTimer_timeout():
	chase()

# ---- Ataques y patrones







func _on_Hurtbox_area_entered(area):
	health -= PlayerManager.player_attack
	if health <= 0:
		queue_free()


func _on_PlayerDetector_body_entered(body):
	_player = body


func _on_Hitbox_area_entered(area):
	PlayerManager.damage_player(attack_value)
	PlayerManager.add_knokback(velocidad)
