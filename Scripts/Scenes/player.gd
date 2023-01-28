extends KinematicBody2D
#
# Main Script para el player
#

# ---- Variables

	# Movimiento
var _pixeles_por_metro : int = 35
var mov_direction : Vector2
var velocidad : Vector2
var acceleration : float = 1 * _pixeles_por_metro
enum Orientations{
	DOWN,
	UP,
	SIDE }
var player_orientation
	# Hijos
onready var animation = $AnimationPlayer
onready var sprite = $AnimatedSprite

# ---- Built-in

func _physics_process(_delta):
	velocidad = move_and_slide(velocidad)


func _input(_event):
	mov_direction = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		mov_direction.x = -1
		if sprite.flip_h == true:
			sprite.flip_h = false
		player_orientation = Orientations.SIDE
	if Input.is_action_pressed("ui_right"):
		mov_direction.x = 1
		if sprite.flip_h == false:
			sprite.flip_h = true
		player_orientation = Orientations.SIDE
	if Input.is_action_pressed("ui_up"):
		mov_direction.y = -1
		player_orientation = Orientations.UP
	if Input.is_action_pressed("ui_down"):
		mov_direction.y = 1
		player_orientation = Orientations.DOWN

# ---- Movimiento

func move():
	mov_direction = mov_direction.normalized() 
	velocidad = mov_direction * acceleration

# ---- Ataque

func attack():
	# Ataca xd
	pass



