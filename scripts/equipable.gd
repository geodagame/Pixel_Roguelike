extends Area2D

export(Resource) var item 


func _on_equipable_body_entered(body):
	#indicamos que el cuerpo que tiene que entrar es player
	if body .is_in_group("Player"):
#indicamos que cuando el objeto sea recogido el slot no sea igual a null 
		if item != null:
#indicamos que el item en cuestion sea guardado en armorinv
			PlayerManager.ArmorInv.add_equipable(item)
			queue_free()
