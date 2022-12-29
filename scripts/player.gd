extends KinematicBody2D
##variables de movimiento, velocidad y direccion

var Pixeles_por_metro : int = 35
var direction : Vector2
var velocidad : Vector2
var rapidez : float = 3 * Pixeles_por_metro
var normalized = direction.normalized()




func _ready():
	print("ignorar") 

##controles para el movimiento

func _input(_event):
	direction.normalized()
	direction = Vector2(0,0)
	if Input.is_action_pressed("ui_left"):
		direction.x = -1
	if Input.is_action_pressed("ui_right"):
		direction.x = 1
	if Input.is_action_pressed("ui_up"):
		direction.y = -1
	if Input.is_action_pressed("ui_down"):
		direction.y = 1

## velicidad de movimiento y tipo de movimiento

func _process(_delta):
	velocidad.x = direction.x * rapidez
	velocidad.y = direction.y * rapidez
	
	velocidad = move_and_slide(velocidad)


