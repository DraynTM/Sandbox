extends Node2D

func _ready():
	$Guard.can_noise = false
	$Guard.cam = 1
	$JUMPSCARE/Animatronic/Camera2D.current = false
	$JUMPSCARE/Animatronic/HUD/Abilities.hide()
	$JUMPSCARE/Animatronic/abilities.can_use_ability = false
	$Guard/Timer2.start()
	$Guard/Door1.position.x -= 40
	$Guard/Door2.position.x += 40
	$Guard/Guard_Vision/CollisionShape2D.position.x -= 40
	$Guard/Guard_Vision/CollisionShape2D2.position.x += 40

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://scenes/Menu.tscn")

func _on_in_pizzera_area_entered(area):
	$Guard.cam = 0
	$Guard.can_noise = true
	#$Ambient.stream = preload("res://audio/Music/The forbidden Nocturne_2.mp3")

func _on_in_surface_area_entered(area):
	$Guard.cam = 1
	$Guard.can_noise = false
	#$Ambient.stream = preload("res://audio/Music/noch-neskolko-sverchkov-34043.ogg")


func _on_Area2D_area_entered(area):
	if $Guard/Area2D.overlaps_area($Animatronic/Area2D):
		var trophy_request = GameJoltAPI.add_achieved({
		 "username": GameJoltAPI.username,
		 "user_token": GameJoltAPI.user_token,
		 "trophy_id": "158692"
		})
		print("trophy unlocked")
		trophy_request
