extends KinematicBody2D


# ---- Variables

	# Movimiento
var Pixeles_por_metro : int = 35
var mov_direction : Vector2
var velocidad : Vector2
var acceleration : float = 1 * Pixeles_por_metro

	# Stats
export var max_health = 10
export var _base_attack = 1
export var _base_defense = 1
var health = max_health
var defense = _base_defense
var attack = _base_attack

	# Hijos
onready var animation = $AnimationPlayer
 

# ---- States

func _input(_event):
	mov_direction = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		mov_direction.x = -1
	if Input.is_action_pressed("ui_right"):
		mov_direction.x = 1
	if Input.is_action_pressed("ui_up"):
		mov_direction.y = -1
	if Input.is_action_pressed("ui_down"):
		mov_direction.y = 1

# ---- Movimiento

func move():
	mov_direction = mov_direction.normalized()
	velocidad = mov_direction * acceleration

func _physics_process(_delta):
	velocidad = move_and_slide(velocidad)
	

# ---- Vida

func damage_player(damage):
	# Función para quitarle vida al jugador
	health -= (damage - defense)
	if health <= 0:
		health = 0
		emit_signal("player_is_dead")

func heal_player(value):
	# Función para curar al jugador
	health += value
	if health > max_health:
		health = max_health




