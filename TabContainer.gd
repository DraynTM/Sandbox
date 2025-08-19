extends TabContainer

onready var object_cursor = get_node("/root/main/Editor_Object")
onready var misc = get_node("/root/main/Editor_Misc")
func _ready():
	pass # Replace with function body.

func _process(delta):
	if current_tab == 0:
		object_cursor.can_place = false
		object_cursor.can_place_misc = false
		object_cursor.can_place_trigger = false
		
		object_cursor.can_place = true
	if current_tab == 1:
		object_cursor.can_place = false
		object_cursor.can_place_misc = false
		object_cursor.can_place_trigger = false
		
		object_cursor.can_place_misc = true
	if current_tab == 2:
		object_cursor.can_place = false
		object_cursor.can_place_misc = false
		object_cursor.can_place_trigger = false
		
		object_cursor.can_place_misc = true
	if current_tab == 3:
		object_cursor.can_place = false
		object_cursor.can_place_misc = false
		object_cursor.can_place_trigger = false
		
		object_cursor.can_place_trigger = true

	if Input.is_action_just_pressed("toggle_editor"):
		Global.playing = !Global.playing
		visible = !Global.playing

	if Global.rank > 1:
		$Misc/ScrollContainer/VBoxContainer/HBoxContainer34/item_tile4.show()
	if Global.rank > 3:
		$Misc/ScrollContainer/VBoxContainer/HBoxContainer34/item_tile5.show()
	if Global.rank > 5:
		$Misc/ScrollContainer/VBoxContainer/HBoxContainer34/item_tile6.show()
	if Global.rank > 7:
		$Misc/ScrollContainer/VBoxContainer/HBoxContainer34/item_tile7.show()
	if Global.rank > 9:
		$Misc/ScrollContainer/VBoxContainer/HBoxContainer34/item_tile8.show()
	if Global.rank > 11:
		$Misc/ScrollContainer/VBoxContainer/HBoxContainer34/item_tile9.show()
	if Global.rank > 14:
		$Misc/ScrollContainer/VBoxContainer/HBoxContainer34/item_tile10.show()
	if Global.rank > 17:
		$Misc/ScrollContainer/VBoxContainer/HBoxContainer34/item_tile11.show()
	if Global.rank > 21:
		$Misc/ScrollContainer/VBoxContainer/HBoxContainer34/item_tile12.show()
	if Global.rank > 24:
		$Misc/ScrollContainer/VBoxContainer/HBoxContainer34/item_tile13.show()
	if Global.rank > 29:
		$Misc/ScrollContainer/VBoxContainer/HBoxContainer34/item_tile14.show()

	pass


func _on_TabContainer_mouse_entered():
	Global.place_tile = false

func _on_TabContainer_mouse_exited():
	Global.place_tile = true

func _on_ScrollContainer_mouse_entered():
	Global.place_tile = false
	pass

func _on_ScrollContainer_mouse_exited():
	Global.place_tile = true
	pass

func _on_Area2D_mouse_entered():
	Global.lock = false

func _on_Area2D_mouse_exited():
	Global.lock = true

func _on_TabContainer_tab_selected(tab):
	pass
