extends Area2D

#~~ Variables ~~

export(Resource) var item;
export(int) var amount = 1

#~~ Funciones ~~

func _on_usable_body_entered(body):

	if body == GameManager.get_player_node("Inventario"): # Revisa que body = player
			# Guarda el item en PotionInv
			PlayerManager.PotionInv.add_usable(item, amount)
			self.queue_free()
