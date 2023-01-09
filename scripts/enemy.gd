extends KinematicBody2D
class_name Enemy, "res://Sprites/Enemies/Enemy.png"

# ---- Variables

	#Movimiento
const FRICTION = 100
export(int) var acceleration = 100
export(int) var MAX_SPEED = 500

	#Pathfinding
var path = [];

	#Nodos hijos y padres
onready var parent = get_parent()
onready var state_machine = $State_Machine
onready var timer = $PathTimer

# ---- Estados

func chase():
	pass

# ---- Codigos que detecta cuando el jugador entra o sale de la vista del enemigo



















