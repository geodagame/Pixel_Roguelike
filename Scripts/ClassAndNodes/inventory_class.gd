class_name Inventory
extends Resource
# 
# Clase de Inventario
#


signal update_item(index)
signal use_item(index)
signal equip_item(inv_index, item, input)
signal item_info(item_name, description)

export (Array, Resource) var inv_slots = [
	null, null, null, null,
]

func add_usable(item : Item, amount : int):
	# Guarda items amontonables
	var index = item.slot
	if inv_slots[index] == null:
		inv_slots[index] = item
		emit_signal("update_item", index)
	if inv_slots[index] is Item:
		inv_slots[index].amount += amount
		emit_signal("update_item", index)


func add_equipable(item : Item):
	# Guarda items no amontonables
	var index = item.find(null, 0)
	inv_slots[index] = item
	emit_signal("update_item", index)


func equip_item(inv_index, item, input):
	# Equipa un item
	var item_to_equip = inv_slots[inv_index]
	inv_slots[inv_index] = item
	emit_signal("update_item", inv_index)
	emit_signal("update_item", inv_index, item_to_equip, input)
	item_to_equip = null


func item_info(index):
	# Muestra información del Item
	var item = inv_slots[index]
	if item is Item:
		emit_signal("item_info", item.item_name, item.description)
	else:
		emit_signal("item_info", "vacio")
	item = null


func use_item(index):
	# Usa un item
	if inv_slots[index] != null:
		inv_slots[index].amount += -1
		emit_signal("use_item", index)
		if inv_slots[index].amount <= 0:
			remove_item(index)


func remove_item(index):
	# Quita un item del inventario
	inv_slots[index] = null
	emit_signal("update_item", index)








