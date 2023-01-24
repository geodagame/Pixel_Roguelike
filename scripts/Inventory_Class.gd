extends Resource

class_name Inventory

#se crean señales para poder hacer funcionar el codigo

signal Updateitem(index)
signal Useitem(index)
signal Equipitem(Invindex, item, imput)
signal Info(Itemname,description)

#se crean arrays que se exportaran como variable slot

export (Array,Resource) var Slot = [
	null, null, null, 
	null, null, null,
	null, null, null, 
	null, null, null
]

#funcion para poder guardar y amontonar los items

func add_usable(item : Item, amount : int):
	var index = item.slot
	if Slot[index] == null:
		Slot[index] = Item
		emit_signal("Updateitem", index)
	if Slot[index] is Item:
		Slot[index].amount += amount
		emit_signal("Updateitem", index)

#funcion para añadir un item que no se puede amontonar

func add_equipable(item : Item):
	var index = item.find(null, 0)
	Slot[index] = item
	emit_signal("Updateitem", index)

#funcion para equipar un item al jugador

func equip_item(invindex,item,input):
	var ItemEquip = Slot[invindex]
	Slot[invindex] = item
	emit_signal("Updateitem", invindex)
	emit_signal("Updateitem", invindex, ItemEquip, input)
	ItemEquip = null

#funcion para mostrar la informacion del item

func item_info(index):
	var item = Slot[index]
	if item is Item:
		emit_signal("Info", item.Item_name, item.description)
	else:
		emit_signal("Info", "vacio")
	item = null

#funcion para usar un item

func use_item(index):
	if Slot[index] != null:
		Slot[index].amount += -1
		emit_signal("Useitem", index)
		if Slot[index].amount <= 0:
			remove_item(index)

#funcion para remover un item del inventario

func remove_item(index):
	Slot[index] = null
	emit_signal("Updateitem", index)








