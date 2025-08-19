extends LineEdit
class_name Console
onready var console_text = get_parent().get_node("ItemList")

func _process(delta):
	if Input.is_action_just_pressed("console"):
		visible = !visible
		console_text.visible = !console_text.visible

func _on_LineEdit_text_entered(new_text):
	if new_text == str("/") + "quit":
		get_tree().quit()
	if new_text == str("/") + "restart":
		get_tree().reload_current_scene()
	if new_text == str("/") + "menu":
		get_tree().change_scene("res://scenes/Menu.tscn")
	if new_text == str("/") + "editor":
		get_tree().change_scene("res://scenes/main.tscn")
	if new_text == str("/") + "animatronic_editor":
		get_tree().change_scene("res://scenes/Animatronic editor.tscn")
	if new_text == str("/") + "fps":
		console_text.add_item("FPS: " + str(Engine.get_frames_per_second()))
	if new_text == str("/") + "time_scale":
		console_text.add_item("TIME SCALE: " + str(Engine.time_scale))
	if new_text == str("/") + "time":
		console_text.add_item(str(OS.get_datetime()))
	if new_text == str("/") + "date":
		console_text.add_item(str(OS.get_date()))
	if new_text == str("/") + "place_tile":
		console_text.add_item(str(Global.place_tile))
	if new_text == str("/") + "position":
		console_text.add_item("PLAYER POSITION: " + str(get_node("/root/main/Animatronic").position))
	if new_text == str("/") + "speed":
		console_text.add_item("PLAYER SPEED: " + str(get_node("/root/main/Animatronic").speed))
	if new_text == str("/") + "play_sound":
		console_text.add_item("PLAYER SPEED: " + str(get_node("/root/main/Animatronic").speed))
