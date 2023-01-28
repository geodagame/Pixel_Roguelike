extends StaticBody2D


var state = "close" #Para evitar que se abra la puerta cuando ya lo está

onready var animationPlayer = $AnimationPlayer


func _ready():
	open()


func open():
	#Abre la puerta
	if state == "close":
		animationPlayer.play("Open");
		state = "open"


func close():
	#Cierra la puerta
	if state == "open":
		animationPlayer.play("Close");
		state = "close"


func get_state():
	#En caso de que algo necesite saber el estado de una puerta
	return state
