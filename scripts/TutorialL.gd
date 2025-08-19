extends Node2D
var lock1 = true
var lock2 = true
func _ready():
	$UI/Tut/AnimationPlayer.play("tut")
	$Animatronic/HUD/Abilities.hide()
	$Animatronic/abilities.can_use_ability = false
	$Animatronic/Camera2D.current = true
	$JUMPSCARE/Animatronic/Camera2D.current = false
	$JUMPSCARE/Animatronic/HUD/Abilities.hide()
	$JUMPSCARE/Animatronic/abilities.can_use_ability = false
	$Guard/Timer2.start()
func _process(delta):
	if (lock1):
		if Input.is_action_just_pressed("w") or Input.is_action_just_pressed("a") or Input.is_action_just_pressed("s") or Input.is_action_just_pressed("d"):
			$UI/Tut/AnimationPlayer.play("past_wasd")
			$Animatronic.can_move = false
			lock1 = false
			$Animatronic/HUD/Abilities/TextureProgress.value = 10000
			$Animatronic/HUD/Abilities.show()
			$Animatronic/abilities.can_use_ability = true
	if (lock2):
		if Input.is_action_just_pressed("ability"):
			$UI/Tut/AnimationPlayer.play("past_abil")
			$Animatronic.can_move = true
			$Guard.guard_type = 0
			lock2 = false
	$Guard/Guard_Vision.monitoring = true


func _on_Area2D_area_entered(area):
	if $Guard/w.overlaps_area(get_parent().get_node("Animatronic/Area2D")):
		$MUSEK.stop()


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/Menu.tscn")
