extends Node2D
onready var paz: Line2D = get_node("Line2D")
onready var obj: KinematicBody2D = get_node("Animatronic")
onready var enemy: KinematicBody2D = get_node("KinematicBody2D")
onready var level: Navigation2D = get_node("Level")
var path : = PoolVector2Array()
var exit_map = false
export var ach = true
func _ready():
	#4$Animatronic/Camera2D.zoom = Vector2(1,1)
	$JUMPSCARE/Animatronic/Camera2D.current = false
	$JUMPSCARE/Animatronic/HUD/Abilities.hide()
	$JUMPSCARE/Animatronic/abilities.can_use_ability = false
	$Countdown.chaing_mode = true

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://scenes/Menu.tscn")
	var pathh := level.get_simple_path(enemy.global_position, obj.global_position)
	paz.points = pathh
	enemy.path = pathh
	if (exit_map):
		$KinematicBody2D.durability -= 1
	if $Countdown.can_Achiv == true:
		if ach == true:
			var trophy_request = GameJoltAPI.add_achieved({
			 "username": GameJoltAPI.username,
			 "user_token": GameJoltAPI.user_token,
			 "trophy_id": "160245"
			})
			print("trophy unlocked")
			trophy_request
		if ach == false:
			var trophy_request = GameJoltAPI.add_achieved({
			 "username": GameJoltAPI.username,
			 "user_token": GameJoltAPI.user_token,
			 "trophy_id": "160246"
			})
			print("trophy unlocked")
			trophy_request

func _on_MAP_area_exited(area):
	exit_map = true
	print("exit")

func _on_Area2D_area_entered(area):
	exit_map = false
