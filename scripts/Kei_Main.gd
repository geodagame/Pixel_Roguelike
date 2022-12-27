extends Node2D

onready var start_room = $StartRoom01
var player = preload("res://Scenes/Player.tscn")
var _player = player.instance() 

func _ready():
	pass

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		start_room._initialize_room();
		
	
