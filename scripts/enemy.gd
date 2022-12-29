extends KinematicBody2D

##variables del enemigo

var Player = null
var Movement = Vector2.ZERO
var Speed = 100

##codigo para que nos siga el enemigo

func _physics_process(delta):
	Movement = Vector2.ZERO
	
	if Player != null:
		Movement = position.direction_to(Player.position)
	else:
		Movement = Vector2.ZERO
	
	Movement = Movement.normalized() * Speed
	Movement = move_and_slide(Movement)

## codigos que detecta cuando el jugador entra o sale de la vista del enemigo

func _on_Area2D_body_entered(body):
	
	if body != self:
		Player = body
	

func _on_Area2D_body_exited(body):
	Player = null
