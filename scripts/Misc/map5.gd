extends Node2D

func _ready():
	$JUMPSCARE/Animatronic/Camera2D.current = false
	$JUMPSCARE/Animatronic/HUD/Abilities.hide()
	$JUMPSCARE/Animatronic/abilities.can_use_ability = false
	$Guard/CanvasLayer/CAM.hide()
	$Guard/Sprite.texture = preload("res://Sprites/Spritesheets/childlol.png")
	$Guard/Door1.texture = preload("res://Sprites/Spritesheets/fnaf4door.png")
	$Guard/Door2.texture = preload("res://Sprites/Spritesheets/fnaf4door.png")
	$Guard/Door1.position.x -= 40
	$Guard/Door2.position.x += 40
	$Guard/Guard_Vision/CollisionShape2D.position.x -= 40
	$Guard/Guard_Vision/CollisionShape2D2.position.x += 40

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://scenes/Menu.tscn")


func _on_Area2D_area_entered(area):
	if $Guard/Area2D.overlaps_area($Animatronic/Area2D):
		var trophy_request = GameJoltAPI.add_achieved({
		 "username": GameJoltAPI.username,
		 "user_token": GameJoltAPI.user_token,
		 "trophy_id": "158693"
		})
		print("trophy unlocked")
		trophy_request
