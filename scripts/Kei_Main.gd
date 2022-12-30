extends Node2D

onready var start_room = $StartRoom01
var player = preload("res://Scenes/Player.tscn")
var _player = player.instance() 

func _ready():
	pass

func _process(_delta):
	
	#---------------
	#DevOnly Section
	#---------------
	if Input.is_action_just_pressed("ui_accept"):
		#DevOnly: Inicia el juego
		start_room._initialize_room();
	if Input.is_action_just_pressed("ui_down"):
		#DevOnly: Fuerza la apertura de todas las puertas
		for door in start_room._container_doors.get_children():
			door.open()
	if Input.is_action_just_pressed("ui_up"):
		#DevOnly: Fuerza el cierre de todas las puertas
		for door in start_room._container_doors.get_children():
			door.close()
		
	
