extends Node2D

func _ready():
	$Guard/Door1.position.x -= 14
	$Guard/Door2.position.x += 14
	$Guard/Guard_Vision/CollisionShape2D.position.x -= 14
	$Guard/Guard_Vision/CollisionShape2D2.position.x += 14
	$Guard/Timer2.start()
	$JUMPSCARE/Animatronic/Camera2D.current = false
	$JUMPSCARE/Animatronic/HUD/Abilities.hide()
	$JUMPSCARE/Animatronic/abilities.can_use_ability = false

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://scenes/Menu.tscn")


func _on_Area2D_area_entered(area):
	if $Guard/Area2D.overlaps_area($Animatronic/Area2D):
		var trophy_request = GameJoltAPI.add_achieved({
		 "username": GameJoltAPI.username,
		 "user_token": GameJoltAPI.user_token,
		 "trophy_id": "158694"
		})
		print("trophy unlocked")
		trophy_request
