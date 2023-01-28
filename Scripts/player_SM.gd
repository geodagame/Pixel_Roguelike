extends StateMachine

onready var _animation_player = parent.get_node("AnimationPlayer")

func _init():
	# Agrega los distintos estados
	_add_state("Idle")
	_add_state("Walk")
	_add_state("Attack")


func _ready():
	set_state(states.Idle)


func _state_logic(_delta: float) -> void:
	#Llama a las funciones que se utilizarán para cada estado
	parent.move()


func _get_transition() -> int:
	# Guarda las condiciones para un cambio de estado
	if parent.mov_direction == Vector2.ZERO:
		return states.Idle
	elif parent.mov_direction != Vector2.ZERO:
		return states.Walk
	return -1


func _enter_state(_previous_state: int, new_state: int) -> void:
	# Cambia la animación dependiendo el estado
	match new_state:
		states.Idle:
			match parent.player_orientation:
				parent.Orientations.DOWN:
					_animation_player.play("Idle_Down")
				parent.Orientations.SIDE:
					_animation_player.play("Idle_Side")
				parent.Orientations.UP:
					_animation_player.play("Idle_Up")
		states.Walk:
			match parent.player_orientation:
				parent.Orientations.DOWN:
					_animation_player.play("Walk_Down")
				parent.Orientations.SIDE:
					_animation_player.play("Walk_Side")
				parent.Orientations.UP:
					_animation_player.play("Walk_Up")
		states.Attack:
			match parent.player_orientation:
				parent.Orientations.DOWN:
					_animation_player.play("Attack_Down")
