extends Navigation2D
#
# Nodo principal de la Dungeon
# Generación procedural

const SPAWN_ROOMS: Array = []
const INTERMEDIATE_ROOMS: Array = []
const END_ROOMS: Array = []

const TILE_SIZE = 16
const FLOOR_TILE_INDEX = 0
const RIGHT_WALL_TILE_INDEX = 0
const LEFT_WALL_TILE_INDEX = 0

export(int) var num_rooms = 5

func _ready():
	pass
