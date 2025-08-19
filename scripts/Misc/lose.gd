extends CanvasLayer

func _on_ITE_pressed():
	$AnimationPlayer.play("RESET")
	get_parent().get_node("Countdown").lock_lock = false

func _on_MENU_pressed():
	get_tree().change_scene("res://scenes/Menu.tscn")
	$AnimationPlayer.play("RESET")
