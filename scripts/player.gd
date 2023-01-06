extends KinematicBody2D
##variables de movimiento, velocidad y direccion

var Pixeles_por_metro : int = 35
var direction : Vector2
var velocidad : Vector2
var rapidez : float = 1 * Pixeles_por_metro
var normalized = direction.normalized()


onready var animation = $AnimationPlayer

func _ready():
	print("ignorar") 

##controles para el movimiento

func _input(_event):
	normalized = direction.normalized()
	direction = Vector2(0,0)
	if Input.is_action_pressed("ui_left"):
		#animation.play("walk")
		direction.x = -1
	if Input.is_action_pressed("ui_right"):
		#animation.play("walk")
		direction.x = 1
	if Input.is_action_pressed("ui_up"):
		#animation.play("walk")
		direction.y = -1
	if Input.is_action_pressed("ui_down"):
		#animation.play("walk")
		direction.y = 1

## velocidad de movimiento y tipo de movimiento

func _process(_delta):
	velocidad.x = direction.x * rapidez
	velocidad.y = direction.y * rapidez
	
	if velocidad != Vector2.ZERO:
		animation.play("walk")
	else:
		animation.play("idle")
	
	velocidad = move_and_slide(velocidad)


