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
	# Nodos hijos y padres
onready var _parent = get_parent()
onready var _state_machine = $StateMachine
onready var _timer = $PathTimer
onready var _pathfinding = $EnemyPathfinding

# ---- Built-in

func _ready():
	_pathfinding.create_new_path()


func _physics_process(_delta):
	pass

# ---- Movimiento

func move():
	#Actualiza la velocidad (Usado en State_Machine)
	mov_direction = mov_direction.normalized()
	velocity += mov_direction * (acceleration * 0.5)
	velocity.limit_length(max_speed)
	$NavigationAgent2D.set_velocity(velocity)


func _on_NavigationAgent2D_velocity_computed(safe_velocity):
	velocity = move_and_slide(safe_velocity)
	velocity = lerp(velocity, Vector2.ZERO, FRICTION) #Reduce velocidad

# ---- Pathfinding

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
	
