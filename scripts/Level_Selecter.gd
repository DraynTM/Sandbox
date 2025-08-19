extends Control

onready var text = $TextureRect/Label
onready var art = $TextureRect
export var map = 0

func _process(delta):
	if $FNAF1.pressed:
		map = 0
		$AudioStreamPlayer.play()
	if $FNAF2.pressed:
		map = 1
		$AudioStreamPlayer.play()
	if $FNAF3.pressed:
		map = 3
		$AudioStreamPlayer.play()
	if $FNAF4.pressed:
		map = 2
		$AudioStreamPlayer.play()
	if $FNAF5.pressed:
		map = 4
		$AudioStreamPlayer.play()
	if $FNAF6.pressed:
		map = 5
		$AudioStreamPlayer.play()
	if $FNAF9.pressed:
		map = 6
		$AudioStreamPlayer.play()
	if $FNAF10.pressed:
		map = 7
		$AudioStreamPlayer.play()
	if $FNAF11.pressed:
		map = 8
		$AudioStreamPlayer.play()
	if $FNAF12.pressed:
		map = 9
		$AudioStreamPlayer.play()
	if $FNAF7.pressed:
		var trophy_request = GameJoltAPI.add_achieved({
		 "username": GameJoltAPI.username,
		 "user_token": GameJoltAPI.user_token,
		 "trophy_id": "158676"
			})
		print("trophy unlocked")
		trophy_request
		get_tree().change_scene("res://scenes/main.tscn")
		$AudioStreamPlayer.play()
	if $FNAF8.pressed:
		get_tree().change_scene("res://scenes/Gameplay.tscn")
		$AudioStreamPlayer.play()
	pass

func _on_left_pressed():
	map -= 1
	$AudioStreamPlayer.play()

func _on_right_pressed():
	map += 1
	$AudioStreamPlayer.play()

func _on_Play_pressed():
	if map == 0:
		get_tree().change_scene("res://scenes/Misc/map1.tscn")
	if map == 1:
		get_tree().change_scene("res://scenes/Misc/map2.tscn")
	if map == 2:
		get_tree().change_scene("res://scenes/Misc/map3.tscn")
	if map == 3:
		get_tree().change_scene("res://scenes/Misc/map4.tscn")
	if map == 4:
		get_tree().change_scene("res://scenes/Misc/map5.tscn")
	if map == 5:
		get_tree().change_scene("res://scenes/Misc/TestMap.tscn")
	if map == 6:
		get_tree().change_scene("res://scenes/Misc/map7.tscn")
	if map == 7:
		get_tree().change_scene("res://scenes/Misc/map6.tscn")
	if map == 8:
		get_tree().change_scene("res://scenes/Misc/map8.tscn")
	if map == 9:
		get_tree().change_scene("res://scenes/Misc/map9.tscn")

func _on_Back_pressed():
	$".".hide()
	$AudioStreamPlayer.play()
