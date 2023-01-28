class_name Item
extends Resource
# Base item 

export(Texture) var texture
export(String) var Item_name
export(String,MULTILINE) var description
export(int,0,11) var slot
export(int,"Pocimas","Armas","Armaduras") var Item_Tipe
export(int,1,99) var value    #salud o ataque
export(int,0,99) var amount   #cantidad





