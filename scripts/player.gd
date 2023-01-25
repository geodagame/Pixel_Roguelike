extends KinematicBody2D


# ---- Variables

	# Movimiento
var Pixeles_por_metro : int = 35
var mov_direction : Vector2
var velocidad : Vector2
var acceleration : float = 1 * Pixeles_por_metro
enum ORIENTATION{
	DOWN,
	UP,
	SIDE
}
var orientation

	# Stats
export var max_health = 10
export var _base_attack = 1
export var _base_defense = 1
var health = max_health
var player_defense = _base_defense
var player_attack = _base_attack

signal player_is_dead

	# Hijos
onready var animation = $AnimationPlayer
onready var sprite = $AnimatedSprite
 

# ---- States

func _input(_event):
	mov_direction = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		mov_direction.x = -1
		if sprite.flip_h == true:
			sprite.flip_h = false
		orientation = ORIENTATION.SIDE
	if Input.is_action_pressed("ui_right"):
		mov_direction.x = 1
		if sprite.flip_h == false:
			sprite.flip_h = true
		orientation = ORIENTATION.SIDE
	if Input.is_action_pressed("ui_up"):
		mov_direction.y = -1
		orientation = ORIENTATION.UP
	if Input.is_action_pressed("ui_down"):
		mov_direction.y = 1
		orientation = ORIENTATION.DOWN

# ---- Movimiento

func move():
	mov_direction = mov_direction.normalized() 
	velocidad = mov_direction * acceleration

func _physics_process(_delta):
	velocidad = move_and_slide(velocidad)
	

func add_knokback(value):
	velocidad = value * acceleration

# ---- Vida

func damage_player(damage):
	# Función para quitarle vida al jugador
	health -= (damage - player_defense)
	print(health)
	if health <= 0:
		health = 0
		emit_signal("player_is_dead")
		#queue_free()

func heal_player(value):
	# Función para curar al jugador
	health += value
	if health > max_health:
		health = max_health
		
# ---- Ataque

func attack():
	# Ataca xd
	pass



