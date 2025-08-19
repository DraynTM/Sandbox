extends Node2D

func _ready():
	randomize()
	$JUMPSCARE/Animatronic/Camera2D.current = false
	$JUMPSCARE/Animatronic/HUD/Abilities.hide()
	$JUMPSCARE/Animatronic/abilities.can_use_ability = false
	$Guard/Timer2.start()
	get_node("Guard/Sprite").texture = preload("res://Sprites/Spritesheets/jeremylol.png")


func _on_Area2D_area_entered(area):
	if $Guard/Area2D.overlaps_area($Animatronic/Area2D):
		var trophy_request = GameJoltAPI.add_achieved({
		 "username": GameJoltAPI.username,
		 "user_token": GameJoltAPI.user_token,
		 "trophy_id": "158701"
		})
		print("trophy unlocked")
		trophy_request

