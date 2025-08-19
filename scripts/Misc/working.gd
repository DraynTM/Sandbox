extends CanvasLayer
export var seconds = 0
export var lock = false
func _process(delta):
	$CD.text = str(seconds) + "% COMPLETED"
	if seconds == 100:
		get_parent().get_node("Animatronic").can_move = false
		get_parent().get_node("Lose_Screen/Control").show()
		get_parent().get_node("Lose_Screen/AnimationPlayer").play("lose")
		seconds = 0

func _on_Timer_timeout():
	if lock == false:
		seconds += 1

func _on_Timer2_timeout():
	pass
