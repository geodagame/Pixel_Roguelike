extends Node

# ---- Variables

var player_exists = false
var game_has_started = false
var player_preload = preload("res://Scenes/Player.tscn")
var player_node 

# ---- Funciones

func get_player_node(called_from):
	if player_exists:
		return player_node
	else:
		print("Error: get_player_node devolvió null en " + called_from)
		return null

func create_player(ruta):
	ruta.add_child(player_preload.instance())
	player_node = ruta.get_node("Player")
	player_exists = true
	
	# Player variables actualization
	DebugMode._player = get_player_node("GameManager");
	PlayerManager._player = get_player_node("GameManager");

func game_over():
	print(" --- Game Over --- ")

func game_start():
	game_has_started = true;
	print("Game Started")

func is_working():
	# --- Debug ---
	print("Game Manager Funcionando")
