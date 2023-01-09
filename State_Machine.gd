extends Node
class_name State_Machine

var states: Dictionary = {}
var previous_state: int = -1 # -1 significa "Ningun estado o nulo"
var state: int = -1 setget set_state

onready var parent = get_parent()
onready var animation_player = parent.get_node("AnimationPlayer")


func _physics_process(delta: float) -> void:
	if state != -1:
		#Mantiene en marcha las siguientes funciones
		_state_logic(delta)
		
		#Si el _get_transition devuelve otro estado, se cambia aquí
		var transition: int = _get_transition()
		if transition != -1:
			set_state(transition)

func _add_state(new_state: String) -> void:
	#Agrega un nuevo estado
	states[new_state] = states.size()
	

func _state_logic(_delta: float) -> void:
	#Llama a las funciones que se utilizarán para cada estado
	
	pass
	
	
func _get_transition() -> int:
	# Guarda las condiciones para un cambio de estado
	
	return -1

func set_state(new_state: int) -> void:
	# Actualiza el estado
	
	_exit_state(state)
	previous_state = state
	state = new_state
	_enter_state(previous_state, state)


func _enter_state(_previous_state: int, _new_state: int) -> void:
	# Cambia la animación dependiendo el estado
	
	pass
	
	
func _exit_state(_state_exited: int) -> void:
	# Efectos conocretos cuando se sale de un estado
	
	pass


