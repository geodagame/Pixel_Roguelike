extends Area2D

export(Resource) var item 


func _on_equipable_body_entered(body):
	if body .is_in_group("Player"): # Revisa que body = player
		if item != null: # Revisa que el slot no sea igual a null
			# Guarda el item en el ArmorInv
			PlayerManager.ArmorInv.add_equipable(item)
			queue_free()
