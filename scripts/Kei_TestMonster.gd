extends KinematicBody2D

onready var timer = $Timer

var rng = RandomNumberGenerator.new()
var velocity = Vector2.ZERO
var _is_timer_finished = false

func _ready():
	timer.start(2);
	
func _physics_process(delta):
	
	if _is_timer_finished == true:
		var direction = Vector2.ZERO
		rng.randomize();
		direction = rng.randf_range(1, 4);
		
		if direction < 2:
			velocity = Vector2.UP * 10
		elif direction < 3:
			velocity = Vector2.DOWN * 10
		elif direction < 4:
			velocity = Vector2.LEFT * 10
		elif direction < 5:
			velocity = Vector2.RIGHT * 10
		else:
			print("Error in enemy movement")
			
		
		timer.start(2);
		_is_timer_finished = false;
	velocity = move_and_slide(velocity)
	
	
func _on_Timer_timeout():
	velocity = Vector2.ZERO
	_is_timer_finished = true;
