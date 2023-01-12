extends Resource

class_name Inventory

signal Updateitem(index)
signal Useitem(index)
signal Equipitem(Invindex, item, imput)
signal Info(Itemname,description)

export (Array,Resource) var Slot = [
	null, null,
	null, null,
	null, null,
	null, null,
	null, null,
	null, null
]

func add_usable(item : Item, amount : int):
	var index = Item.slot
	if Slot[index] == null:
		Slot[index] = Item
		emit_signal("Updateitem", index)
	if Slot[index] is Item:
		Slot[index].amount += amount
		emit_signal("Updateitem", index)
		
func add_equipable(item : Item):
	var index = item.find(null, 0)
	Slot[index] = item
	emit_signal("Updateitem", index)
	
func equip_item(invindex,item,input):
	var ItemEquip
















