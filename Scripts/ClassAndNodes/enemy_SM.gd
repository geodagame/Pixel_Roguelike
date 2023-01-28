extends State_Machine

func _init():
	_add_state("chase")
	_add_state("attack")

func _ready():
	set_state(states.chase)
	
func _state_logic(_delta: float) -> void:
	#Llama a las funciones que se utilizarán para cada estado
	parent.move()
	


