extends Area2D

#~~ Variables ~~

export(Resource) var item;
var amount = 1

#~~ Funciones ~~

func _on_usable_body_entered(body):
#indicamos que el cuerpo que tiene que entrar es player
	if body .is_in_group("Player"):
#indicamos que cuando el objeto sea recogido el slot no sea igual a null 
		if item != null:
#indicamos que el item en cuestion sea guardado en potioninv
			PlayerManager.PotionInv.add_usable(item, amount)
			self.queue_free()
