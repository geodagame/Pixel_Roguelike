extends Resource

class_name Inventory

#se crean señales para poder hacer funcionar el codigo

signal Updateitem(index)
signal Useitem(index)
signal Equipitem(Invindex, item, imput)
signal Info(Itemname,description)

#se crean arrays que se exportaran como variable slot

export (Array,Resource) var slot = [
	null, null,
	null, null,
	null, null,
	null, null,
	null, null,
	null, null
]

#funcion para poder guardar y amontonar los items

func add_usable(_item : Item, amount : int):
	var index = Item.slot
	if slot[index] == null:
		slot[index] = Item
		emit_signal("Updateitem", index)
	if slot[index] is Item:
		slot[index].amount += amount
		emit_signal("Updateitem", index)

#funcion para añadir un item que no se puede amontonar

func add_equipable(item : Item):
	var index = item.find(null, 0)
	slot[index] = item
	emit_signal("Updateitem", index)

#funcion para equipar un item al jugador

func equip_item(invindex,item,input):
	var ItemEquip = slot[invindex]
	slot[invindex] = item
	emit_signal("Updateitem", invindex)
	emit_signal("Updateitem", invindex, ItemEquip, input)
	ItemEquip = null

#funcion para mostrar la informacion del item

func item_info(index):
	var item = slot[index]
	if item is Item:
		emit_signal("Info", item.Item_name, item.description)
	else:
		emit_signal("Info", "vacio")
	item = null

#funcion para usar un item

func use_item(index):
	if slot[index] != null:
		slot[index].amount += -1
		emit_signal("Useitem", index)
		if slot[index].amount <= 0:
			remove_item(index)

#funcion para remover un item del inventario

func remove_item(index):
	slot[index] = null
	emit_signal("Updateitem", index)








