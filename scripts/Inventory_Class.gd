extends Resource

class_name Inventory

#se crean señales para poder hacer funcionar el codigo

signal Updateitem(index)
signal Useitem(index)
signal Equipitem(Invindex, item, imput)
signal Info(Itemname,description)

#se crean arrays que se exportaran como variable slot

export (Array,Resource) var Inv_Slot = [
	null, null, null, 
	null, null, null,
	null, null, null, 
	null, null, null
]

#funcion para poder guardar y amontonar los items

func add_usable(item : Item, amount : int):
	var index = item.slot
	if Inv_Slot[index] == null:
		Inv_Slot[index] = item
		emit_signal("Updateitem", index)
	if Inv_Slot[index] == item:
		Inv_Slot[index].amount += amount
		emit_signal("Updateitem", index)

#funcion para añadir un item que no se puede amontonar

func add_equipable(item : Item):
	var index = item.find(null, 0)
	Inv_Slot[index] = item
	emit_signal("Updateitem", index)

#funcion para equipar un item al jugador

func equip_item(invindex,item,input):
	var ItemEquip = Inv_Slot[invindex]
	Inv_Slot[invindex] = item
	emit_signal("Updateitem", invindex)
	emit_signal("Updateitem", invindex, ItemEquip, input)
	ItemEquip = null

#funcion para mostrar la informacion del item

func item_info(index):
	var item = Inv_Slot[index]
	if item is Item:
		emit_signal("Info", item.Item_name, item.description)
	else:
		emit_signal("Info", "vacio")
	item = null

#funcion para usar un item

func use_item(index):
	if Inv_Slot[index] != null:
		Inv_Slot[index].amount += -1
		emit_signal("Useitem", index)
		if Inv_Slot[index].amount <= 0:
			remove_item(index)

#funcion para remover un item del inventario

func remove_item(index):
	Inv_Slot[index] = null
	emit_signal("Updateitem", index)








