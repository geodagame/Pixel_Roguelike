extends Resource

class_name Item

export(Texture) var texture
export(String) var Item_name
export(String,MULTILINE) var description
export(int,0,11) var slot
export(int,"Pocimas","Armas","Armaduras") var Item_Tipe
export(int,1,99) var value    #salud o ataque
export(int,0,99) var ammount   #cantidad





