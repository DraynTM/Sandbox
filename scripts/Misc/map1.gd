extends Node2D
export var achiv = 0
func _ready():
	#4$Animatronic/Camera2D.zoom = Vector2(1,1)
	$JUMPSCARE/Animatronic/Camera2D.current = false
	$JUMPSCARE/Animatronic/HUD/Abilities.hide()
	$JUMPSCARE/Animatronic/abilities.can_use_ability = false
	$Guard/Timer2.start()
	
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://scenes/Menu.tscn")


func _on_Area2D_area_entered(area):
	if $Guard/Area2D.overlaps_area($Animatronic/Area2D):
		if achiv == 0:
			var trophy_request = GameJoltAPI.add_achieved({
			 "username": GameJoltAPI.username,
			 "user_token": GameJoltAPI.user_token,
			 "trophy_id": "158690"
			})
			print("trophy unlocked")
			trophy_request
		if achiv == 1:
			var trophy_request = GameJoltAPI.add_achieved({
			 "username": GameJoltAPI.username,
			 "user_token": GameJoltAPI.user_token,
			 "trophy_id": "158691"
			})
			print("trophy unlocked")
			trophy_request
