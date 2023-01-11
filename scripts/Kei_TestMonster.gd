extends KinematicBody2D

onready var timer = $Timer

var rng = RandomNumberGenerator.new()
var velocity = Vector2.ZERO
var _is_timer_finished = false

func _ready():
	# Inicia el Timer para el movimiento
	
	timer.start(2);
	
func _physics_process(_delta):
	#Movimiento del monstruo
	
	if _is_timer_finished == true:
		#Usa un sistema de aleatoriedad para el movimiento
		#Decide una dirección aleatoria cada vez que el timer se apaga
		
		var mov_direction = Vector2.ZERO
		
		rng.randomize();
		mov_direction = rng.randf_range(1, 4);
		if mov_direction < 2:
			velocity = Vector2.UP * 10
		elif mov_direction < 3:
			velocity = Vector2.DOWN * 10
		elif mov_direction < 4:
			velocity = Vector2.LEFT * 10
		elif mov_direction < 5:
			velocity = Vector2.RIGHT * 10
		else:
			print("Error in enemy movement")
			
		timer.start(2);
		_is_timer_finished = false; 
	
	velocity = move_and_slide(velocity)
	
	
func _on_Timer_timeout():
	#Convierte la velocidad del enemigo en 0, para que se detenga el enemigo.
	velocity = Vector2.ZERO
	_is_timer_finished = true;
