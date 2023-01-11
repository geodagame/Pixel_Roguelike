extends KinematicBody2D
class_name Enemy, "res://Sprites/Enemies/Enemy.png"

# ---- Variables

	#Movimiento
const FRICTION = 0.15
export(int) var acceleration = 40
export(int) var max_speed = 100
var mov_direction = Vector2.ZERO
var velocidad = Vector2.ZERO

	#Pathfinding
var path = [];
export var _path_to_player := NodePath()

	#Nodos hijos y padres
onready var parent = get_parent()
onready var state_machine = $State_Machine
onready var timer = $PathTimer
onready var _agent = $NavigationAgent2D
onready var _player = get_node(_path_to_player)


# ---- Estados

func chase():
	# Función básica de persecución
	if path:
		# Si hay un Path, guarda el siguiente punto al que ir
		var vector_to_next_point = path[0] - global_position 
		var distance_to_next_point = vector_to_next_point.length();
		if distance_to_next_point < 1:
			#Si la distancia al siguiente punto es menor a 1, borra el punto
			path.remove(0);
			if not path:
				#Si no hay más puntos, detiene la función
				return
		
		mov_direction = vector_to_next_point
	

# ---- Movimiento

func _physics_process(_delta):
	move()
	# Move_and_slide no funciona fuera de _physics_process xd
	velocidad = move_and_slide(velocidad)
	velocidad = lerp(velocidad, Vector2.ZERO, FRICTION) #Reduce velocidad
	
	#Pathfinding
	#mov_direction = global_position.direction_to(_agent.get_next_location())
	
func move():
	#Actualiza la velocidad
	mov_direction = mov_direction.normalized()
	velocidad += mov_direction * acceleration
	velocidad.limit_length(max_speed)

# ---- Pathfinding

func _on_PathTimer_timeout():
	#path = Navigation2DServer.map_get_path(global_position, parent.player.position)
	mov_direction = global_position.direction_to(_agent.get_next_location())
	pass
