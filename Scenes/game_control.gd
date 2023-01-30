extends Control
var paused = false

func _ready():
	pass


func _on_Button_button_up():
	paused = not paused
	
	if paused:
		# Pausa el juego al abrir inventario
		get_tree().paused = true
	else:
		# Despausa el juego al cerrar inventario
		get_tree().paused = false
