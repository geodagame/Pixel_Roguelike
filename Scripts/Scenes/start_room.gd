extends Node2D


onready var door = $Doors/Door
onready var enemy_position = $EnemyPosition

export(PackedScene) var monster1 = preload("res://Monsters/TestMonster.tscn")

func initialize_room():
	door.open();
	enemy_position.add_child(monster1.instance())
	
	

