extends Node

# ---- Variables

	# Bonuses
var armor_defense_bonus = 0
var weapon_attack_bonus = 0
var effect_defense_bonus = 1
var effect_attack_bonus = 1

	# Stats
export var max_health = 10
export var _base_attack = 1
export var _base_defense = 1
var health = max_health
var player_defense = (_base_defense + armor_defense_bonus) * effect_defense_bonus 
var player_attack = (_base_attack + weapon_attack_bonus) * effect_attack_bonus

	# Hijos
onready var _player = get_tree().current_scene.get_node("Player")

# ---- Vida

func damage_player(damage):
	# Función para quitarle vida al jugador
	health -= (damage - player_defense)
	print(health) # Debug
	print(_player); # Debug
	if health <= 0 and _player:
		health = 0
		_player.emit_signal("player_is_dead")
		#_player.queue_free() # Bugged
		

func heal_player(value):
	# Función para curar al jugador
	health += value
	if health > max_health:
		health = max_health

func add_knokback(value):
	_player.velocidad = value * _player.acceleration
