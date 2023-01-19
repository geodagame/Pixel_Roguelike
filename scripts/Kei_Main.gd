extends Node2D

onready var _container_doors = $Doors
onready var start_room = $StartRoom01
onready var player_spawn = $StartRoom01/PlayerSpawn

var player = preload("res://Scenes/Player.tscn")
var _player = player.instance() 
var _is_game_started = false

func _ready():
	pass

func _process(_delta):
	
	#---------------
	#DevOnly Section
	#---------------
	if Input.is_action_just_pressed("ui_accept"):
		#DevOnly: Inicia el juego
		if _is_game_started == false:
			_player.global_position = player_spawn.global_position
			call_deferred("add_child", _player)
			start_room._initialize_room();
			_is_game_started = true
	if Input.is_action_just_pressed("DevOnly_OpenDoors"):
		#DevOnly: Fuerza la apertura de todas las puertas
		for door in _container_doors.get_children():
			door.open()
	if Input.is_action_just_pressed("DevOnly_CloseDoors"):
		#DevOnly: Fuerza el cierre de todas las puertas
		for door in _container_doors.get_children():
			door.close()
		
	
