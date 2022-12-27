extends StaticBody2D


onready var animationPlayer = $AnimationPlayer

var state = "close"

func _ready():
	open()

func open():
	if state == "close":
		animationPlayer.play("Open");
		state = "open"

func close():
	if state == "open":
		animationPlayer.play("Close");
		state = "close"

func _get_state():
	return state
