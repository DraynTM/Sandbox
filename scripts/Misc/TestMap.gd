extends Node2D

var chat = 0
onready var press_enter = $HUD/press_enter

func _ready():
	pass



func _process(delta):
#	var new_path : = navigation.get_simple_path(character.global_position, $Animatronic.global_position)
#	$Line2D.points = new_path
#	character.path = new_path
	#$Level.get_simple_path($KinematicBody2D.position, $Animatronic.position)
	#print(chat)
	if chat == 1 or chat > 1:
		if Input.is_action_just_pressed("ui_accept"):
			dialogue()
			chat = 0
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://scenes/Menu.tscn")

func dialogue():
	if chat == 1:
		var dialog = Dialogic.start("Drayn_Sleepin")
		add_child(dialog)
	if chat == 2:
		var dialog = Dialogic.start("Genos")
		add_child(dialog)
	if chat == 3:
		var dialog = Dialogic.start("Drayn_Teleports")
		add_child(dialog)
	if chat == 4:
		var dialog = Dialogic.start("Genos_Shaders")
		add_child(dialog)
	if chat == 5:
		var dialog = Dialogic.start("Sans_Abil")
		add_child(dialog)
	if chat == 6:
		var dialog = Dialogic.start("Genos_Shaking")
		add_child(dialog)
	if chat == 7:
		var dialog = Dialogic.start("Sans_CB")
		add_child(dialog)

func _on_Area2D_area_entered(area):
	press_enter.show()
	chat = 1
func _on_Area2D_area_exited(area):
	press_enter.hide()
	chat = 0
func _on_Area2D2_area_entered(area):
	press_enter.show()
	chat = 2
func _on_Area2D2_area_exited(area):
	press_enter.hide()
	chat = 0
func _on_Area2D3_area_entered(area):
	press_enter.show()
	chat = 3
func _on_Area2D4_area_entered(area):
	press_enter.show()
	chat = 7
func _on_Area2D5_area_entered(area):
	press_enter.show()
	chat = 5
func _on_Area2D6_area_entered(area):
	press_enter.show()
	chat = 4
func _on_Area2D7_area_entered(area):
	press_enter.show()
	chat = 6
