extends Node

# ---- Variables

var player_exists = false
var game_has_started = false

# ---- Funciones

func game_over():
	print(" --- Game Over --- ")

func game_start():
	game_has_started = true;
	print("Game Started")

func is_working():
	# --- Debug ---
	print("Game Manager Funcionando")
