extends CanvasLayer
var can_Achiv = false
export var seconds = 0
export var hours = 0
export var lock = false
export var lock_lock = false
export var chaing_mode = false
func _process(delta):
	$CD.text = str(hours) + ":" + str(seconds) + "AM"
	if seconds == 60 or seconds > 60:
		hours += 1
		seconds = 0
	if chaing_mode == false:
		if hours == 6:
			get_parent().get_node("Animatronic").can_move = false
			get_parent().get_node("Lose_Screen/Control/am").show()
			get_parent().get_node("Lose_Screen/AnimationPlayer").play("lose")
		hours = 0
	if chaing_mode == true:
		if lock_lock == false:
			if hours == 6:
				get_parent().get_node("JUMPSCARE/jump").play("jumpscare")
				get_parent().get_node("JUMPSCARE/Timer").start()
				get_parent().get_node("Animatronic").can_move = false
				hours = 0
				can_Achiv = true

func _on_Timer_timeout():
	if chaing_mode == false:
		if lock == false:
			seconds += 1
	if chaing_mode == true:
		if lock == false:
			seconds += 2

func _on_Timer2_timeout():
	pass
