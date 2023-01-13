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
	var ItemEquip = Slot[invindex]
	Slot[invindex] = item
	emit_signal("Updateitem", invindex)
	emit_signal("Updateitem", invindex, ItemEquip, input)
	ItemEquip = null

func item_info(index):
	var item = Slot[index]
	if item is Item:
		emit_signal("Info", item.Item_name, item.description)
	else:
		emit_signal("Info", "vacio")
	item = null

func use_item(index):
	if Slot[index] != null:
		Slot[index].amount += -1
		emit_signal("Useitem", index)
		if Slot[index].amount <= 0:
			remove_item(index)
		
func remove_item(index):
	Slot[index] = null
	emit_signal("Updateitem", index)








