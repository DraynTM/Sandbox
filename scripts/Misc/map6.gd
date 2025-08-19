extends Node2D
var tel = 0
func _ready():
	randomize()
	$JUMPSCARE/Animatronic/Camera2D.current = false
	$JUMPSCARE/Animatronic/HUD/Abilities.hide()
	$JUMPSCARE/Animatronic/abilities.can_use_ability = false
	$Guard/CanvasLayer/CAM.hide()
	$Level/TileMap3.hide()

func teleport():
#	if $Guard.guard_type == 2:
#
	pass

func _on_Timer_timeout():
	tel = ceil(rand_range(0,4))
	$Timer.wait_time = ceil(rand_range(4,6))
	$teleport.play()
	if tel == 0:
		$Animatronic.position = $Position2D.position
	if tel == 1:
		$Animatronic.position = $Position2D2.position
	if tel == 2:
		$Animatronic.position = $Position2D3.position
	if tel == 3:
		$Animatronic.position = $Position2D4.position
	if tel == 4:
		$Animatronic.position = $Position2D5.position
	pass # Replace with function body.


func _on_Area2D_area_entered(area):
	if $Guard/Area2D.overlaps_area($Animatronic/Area2D):
		var trophy_request = GameJoltAPI.add_achieved({
		 "username": GameJoltAPI.username,
		 "user_token": GameJoltAPI.user_token,
		 "trophy_id": "158697"
		})
		print("trophy unlocked")
		trophy_request

