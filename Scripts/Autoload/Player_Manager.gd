extends Node

# ---- Variables

signal player_died
	# Bonuses
var armor_defense_bonus = 0
var weapon_attack_bonus = 0
var effect_defense_bonus = 1
var effect_attack_bonus = 1
	# Stats
const MAX_HEALTH = 10
const BASE_ATTACK = 1
const BASE_DEFENSE = 1
var player_health = MAX_HEALTH
var player_defense = (BASE_DEFENSE + armor_defense_bonus) * effect_defense_bonus 
var player_attack = (BASE_ATTACK + weapon_attack_bonus) * effect_attack_bonus
	# Hijos
onready var _player
	# Equipo
const PotionInv = preload("res://Scenes/Resources/potion_inventory.tres")
const ArmorInv = preload("res://Scenes/Resources/armor_inventory.tres")
const SwordInv = preload("res://Scenes/Resources/weapon_inventory.tres")
var weapons : Array = [null, null]
var money : int

# ---- Built In

func _ready():
	if GameManager.player_exists: 
		_player = GameManager.get_player_node("PlayerManager")
		
		# Equipo
	var _Equip = SwordInv.connect("equip_item", self, "equiped")
	var _update = PotionInv.connect("update_item", self, "update_item")

# ---- Vida

func damage_player(damage):
	# Función para quitarle vida al jugador
	if GameManager.player_exists == false: 
		print("Error: damage_player no encontró jugador")
		return
	player_health -= (damage - player_defense)
	print("Vida: " + str(player_health)) # Debug
	#print(_player); # Debug
	if player_health <= 0 and _player:
		player_health = 0
		emit_signal("player_died")
		#_player.queue_free() # Bugged


func heal_player(value):
	# Función para curar al jugador
	if GameManager.player_exists == false: 
		print("Error: heal_player no encontró jugador")
		return
	player_health += value
	if player_health > MAX_HEALTH:
		player_health = MAX_HEALTH


func add_knokback(value):
	_player.velocidad = value * _player.acceleration


# ---- Inventario

func equiped(_index, item, buttom : int):
	weapons[buttom] = item


func update_item(_item_index):
	pass
