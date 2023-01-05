extends KinematicBody2D
class_name Enemy, "res://Sprites/Enemies/Phantom.png"

## Variables
var path: PoolVector2Array


var Player = null
var Movement = Vector2.ZERO
var Speed = 100

onready var navigation: Navigation2D = get_tree().current_scene.get_node("Navigation2D")
onready var player: KinematicBody2D = get_tree().current_scene.get_node("Player")
onready var sprite = $Sprite

## Codigo para que nos siga el enemigo

func _physics_process(_delta):
	
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

func _on_Area2D_body_exited(_body):
	
	Player = null
	
## Inteligencia Artificial 

func chase():
	if path:
		var vector_to_next_point: Vector2 = path[0] - global_position
		var distance_to_next_point: float = vector_to_next_point.length()
		
		if distance_to_next_point < 1:
			path.remove(0)
			if not path:
				return
		Movement = vector_to_next_point
		
		if vector_to_next_point.x > 0 and sprite.flip_h:
			sprite.flip_h = false
		elif vector_to_next_point.x < 0 and not sprite.flip_h:
			sprite.flip_h = true
		
		





















func _on_PathTimer_timeout():
	path = navigation.get_simple_path(global_position, player.position)
