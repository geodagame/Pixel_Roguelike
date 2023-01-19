extends Area2D

#~~ Variables ~~

export(Resource) var item;
var amount = 1

#~~ Funciones ~~

func _on_usable_body_entered(body):
	if body .is_in_group("Player"):
		if item != null:
			PlayerManager.PotionInv.add_usable(item, amount)
			self.queue_free()
