extends Control

onready var Inv = $Inventario # Controldor del Inventario

func _on_SalirInv_button_up():
	Inv.visible = !Inv.visible
	
	if Inv.visible:
		# Pausa el juego al abrir inventario
		get_tree().paused = true
	else:
		# Despausa el juego al cerrar inventario
		get_tree().paused = false


func update_potion(index):
	# Modifica el boton de las pociones
	Inv.pocimas.PotionSlot.texture = PlayerManager.PotionInv.Inv_Slot[index].texture



