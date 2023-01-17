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
onready var _player

	# Equipo
var PotionInv = preload("res://Sprites/Items/Inventario de pocimas.tres")
var ArmorInv = preload("res://Sprites/Items/Inventario de armaduras.tres")
var SwordInv = preload("res://Sprites/Items/Inventario de armas.tres")

var weapons : Array = [null, null]

var money : int


func _ready():
	if GameManager.player_exists: 
		_player = GameManager.get_player_node("PlayerManager")
		
		# Equipo
	var _Equip = SwordInv.connect("Equipitem", self, "Equiped")

# ---- Vida

func damage_player(damage):
	# Función para quitarle vida al jugador
	if GameManager.player_exists == false: 
		print("Error: damage_player no encontró jugador")
		return
	
	health -= (damage - player_defense)
	print(health) # Debug
	print(_player); # Debug
	if health <= 0 and _player:
		health = 0
		GameManager.game_over();
		#_player.queue_free() # Bugged
		

func heal_player(value):
	# Función para curar al jugador
	if GameManager.player_exists == false: 
		print("Error: heal_player no encontró jugador")
		return
	health += value
	if health > max_health:
		health = max_health

func add_knokback(value):
	_player.velocidad = value * _player.acceleration


# ---- Inventario

func equioed(_index, item, buttom : int):
	weapons[buttom] = item
