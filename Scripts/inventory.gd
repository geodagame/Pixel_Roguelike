extends Control

onready var Inv = $Inventario
#la variable Inv es el inventario
onready var Inv_Manager = $InvManager

func _on_SalirInv_button_up():
	Inv.visible = !Inv.visible
	
	if Inv.visible:
		get_tree().paused =true
#este codigo es para que cuando Inv sea visible se pause el juego
	else:
		get_tree().paused = false
#y al contrario del anterior este codigo hace que cuando Inv sea invisible despause el juego



func _on_InvManager_Updateitem(index):
	pass
