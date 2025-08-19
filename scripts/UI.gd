extends CanvasLayer
export var can_save_png = false
export var can_menu = true
onready var pos = get_parent().get_node("Spawnpoint")
onready var music = $AudioStreamPlayer/Ambient
onready var ms = $BG_Music2
onready var map = get_parent().get_node("Level/LineEdit")
onready var author = get_parent().get_node("Level/LineEdit2")
onready var mode = get_parent().get_node("Level/mode")
onready var grid = get_parent().get_node("Grid")

func _process(delta):
	if Input.is_action_just_pressed("1"):
		$Item_Select/TabContainer.current_tab = 0
	if Input.is_action_just_pressed("2"):
		$Item_Select/TabContainer.current_tab = 1
	if Input.is_action_just_pressed("3"):
		$Item_Select/TabContainer.current_tab = 2
	if Input.is_action_just_pressed("4"):
		$Item_Select/TabContainer.current_tab = 3
	
	if can_save_png == true: #сохранение карты в png
		if Input.is_action_just_pressed("ui_select"):
			yield(VisualServer, "frame_post_draw")
			var img = get_viewport().get_texture().get_data()
			img.flip_y()
			img.save_png("res://Maps/Map.png")
			exit_camera_mode()
	
	if can_menu == true: #открытие меню
		if Input.is_action_just_pressed("ui_cancel"):
			if $Menu.visible == false:
				get_parent().get_node("Editor_Object").can_cam_move = false
			if $Menu.visible == true:
				get_parent().get_node("Editor_Object").can_cam_move = true
			$Faz_Coins.visible = !$Faz_Coins.visible
			$Menu.visible = !$Menu.visible
	
	if get_parent().get_node("Level/mode").value == 0:
		$Guard/CM/Label.text = "Classic"
		get_parent().get_node("Guard").show()
		get_parent().get_node("KinematicBody2D").hide()
		get_parent().get_node("Guard").guard_type = 0
		get_parent().get_node("KinematicBody2D").mode = 0
		get_parent().get_node("KinematicBody2D/Area2D").monitoring = false
		get_parent().get_node("Guard/Sprite/Area2D").monitoring = true
		get_parent().get_node("Guard/Door1/StaticBody2D").monitoring = true
		get_parent().get_node("Guard/Door2/StaticBody2D").monitoring = true
		get_parent().get_node("Countdown").chaing_mode = false
		get_parent().get_node("Guard/Door1").show()
		get_parent().get_node("Guard/Door2").show()
		get_parent().get_node("Guard/Mask").monitoring = false
	if get_parent().get_node("Level/mode").value == 1:
		$Guard/CM/Label.text = "Chasing"
		get_parent().get_node("Guard").hide()
		get_parent().get_node("KinematicBody2D").show()
		get_parent().get_node("Guard").guard_type = 1
		get_parent().get_node("KinematicBody2D").mode = 1
		get_parent().get_node("KinematicBody2D/Area2D").monitoring = true
		get_parent().get_node("Guard/Sprite/Area2D").monitoring = false
		get_parent().get_node("Guard/Door1/StaticBody2D").monitoring = false
		get_parent().get_node("Guard/Door2/StaticBody2D").monitoring = false
		get_parent().get_node("Countdown").chaing_mode = true
		get_parent().get_node("Guard/Mask").monitoring = false
	if get_parent().get_node("Level/mode").value == 2:
		$Guard/CM/Label.text = "Mask"
		get_parent().get_node("Guard").show()
		get_parent().get_node("KinematicBody2D").hide()
		get_parent().get_node("Guard").guard_type = 3
		get_parent().get_node("Guard").mask_system()
		get_parent().get_node("KinematicBody2D").mode = 0
		get_parent().get_node("KinematicBody2D/Area2D").monitoring = false
		get_parent().get_node("Guard/Sprite/Area2D").monitoring = false
		get_parent().get_node("Guard/Mask").monitoring = true
		get_parent().get_node("Guard/Door1/StaticBody2D").monitoring = false
		get_parent().get_node("Guard/Door2/StaticBody2D").monitoring = false
		get_parent().get_node("Guard/Door1").hide()
		get_parent().get_node("Guard/Door2").hide()
		get_parent().get_node("Countdown").chaing_mode = false
	
	get_parent().get_node("CanvasModulate").color = get_parent().get_node("Level/ColorPicker").color
	if Input.is_action_just_pressed("ui_home"):
		$SP_Pos.popup_centered()
	if Input.is_action_just_pressed("lightning"):
		$Lightning2.show()
		$ColorPicker.show()
	if get_parent().get_node("Level/mode").value == -1:
		get_parent().get_node("Level/mode").value = 0
	if get_parent().get_node("Level/mode").value == 3:
		get_parent().get_node("Level/mode").value = 2
	get_parent().get_node("Level/amb").value = $BG_Music.selected
	get_parent().get_node("Spawnpoint").position.x = get_parent().get_node("Level/Spawnpointx").value
	get_parent().get_node("Spawnpoint").position.y = get_parent().get_node("Level/Spawnpointy").value
	get_parent().get_node("Guard").position.x = get_parent().get_node("Level/Guardx").value
	get_parent().get_node("Guard").position.y = get_parent().get_node("Level/Guardy").value
	get_parent().get_node("Triggers").player_scale_x = $Settings/x.value
	get_parent().get_node("Triggers").player_scale_y = $Settings/y.value
	get_parent().get_node("Triggers").cam_zoom_x = $Settings/x2.value
	get_parent().get_node("Triggers").cam_zoom_y = $Settings/y2.value
	get_parent().get_node("Triggers").conveyor_speed = $Settings/cbspeed.value
	$Menu/NA.text = "Name of Map: " + str(get_parent().get_node("Level/LineEdit").text)
	$Menu/NA2.text = "Author of Map: " + str(get_parent().get_node("Level/LineEdit2").text)
	$Menu/NA3.text = "Description: " + str(get_parent().get_node("Level/LineEdit3").text)
	get_parent().get_node("Level/Spawnpointx").hide()
	get_parent().get_node("Level/Spawnpointy").hide()
	get_parent().get_node("Level/Guardx").hide()
	get_parent().get_node("Level/Guardy").hide()
	get_parent().get_node("Level/ColorPicker").hide()
	get_parent().get_node("Level/LineEdit").hide()
	get_parent().get_node("Level/LineEdit2").hide()
	get_parent().get_node("Level/LineEdit3").hide()
	get_parent().get_node("Level/amb").hide()
	get_parent().get_node("Level/mode").hide()
	
#	if $Guard/EG.pressed == true:
#		get_parent().get_node("Guard").guard_type = 0
#		get_parent().get_node("Guard").doors_system()
#	if $Guard/EG.pressed == false:
#		get_parent().get_node("Guard").guard_type = 1
	if $Settings/EC.pressed == true:
		get_parent().get_node("Countdown").lock = true
	if $Settings/EC.pressed == false:
		get_parent().get_node("Countdown").lock = false
	if $brushsett/CheckBox.pressed == true:
		grid.show()
	if $brushsett/CheckBox.pressed == false:
		grid.hide()

func _on_Lightning_pressed():
	$ColorPicker.visible = !$ColorPicker.visible
	$AudioStreamPlayer/confirm.play()
	pass # Replace with function body.

func _on_Lightning2_pressed():
	$Lightning2.hide()
	$ColorPicker.hide()
	pass # Replace with function body.

func _on_TEST_MAP_pressed():
	pass

func _on_BG_Music_mouse_entered():
	Global.place_tile = false
	$BG_Music/BGM.show()

func _on_BG_Music_mouse_exited():
	Global.place_tile = true
	$BG_Music/BGM.hide()

func _on_Lightning_mouse_entered():
	Global.place_tile = false

func _on_Lightning_mouse_exited():
	Global.place_tile = true

func _on_Lightning2_mouse_entered():
	Global.place_tile = false

func _on_Lightning2_mouse_exited():
	Global.place_tile = true

func _on_Hide_Spawnpoint_mouse_entered():
	Global.place_tile = false

func _on_Hide_Spawnpoint_mouse_exited():
	Global.place_tile = true

func _on_ColorPicker_mouse_entered():
	Global.place_tile = false

func _on_ColorPicker_mouse_exited():
	Global.place_tile = true

func _on_BG_Music2_mouse_entered():
	Global.place_tile = false
	$BG_Music2/BGM.show()

func _on_BG_Music2_mouse_exited():
	Global.place_tile = true
	$BG_Music2/BGM.hide()

func _on_BG_Music2_item_selected(index):
	pass

func _on_FileDialog_mouse_entered():
	Global.another_locker = false

func _on_FileDialog_mouse_exited():
	Global.another_locker = true

func _on_FileDialog2_mouse_entered():
	Global.another_locker = false

func _on_FileDialog2_mouse_exited():
	Global.another_locker = true

func _on_SAVE_MAP_mouse_entered():
	Global.place_tile = false

func _on_SAVE_MAP_mouse_exited():
	Global.place_tile = true

func _on_LOAD_MAP_mouse_entered():
	Global.place_tile = false

func _on_LOAD_MAP_mouse_exited():
	Global.place_tile = true

func _on_OPTIONS_pressed():
	$Menu/Options.visible = !$Menu/Options.visible
	$AudioStreamPlayer/confirm.play()

func _on_MENU_BUTTON_pressed():
	Global.place_tile = !Global.place_tile
	$Menu.visible = !$Menu.visible
	$AudioStreamPlayer/confirm.play()

func _on_TO_EDITOR_pressed():
	Global.place_tile = !Global.place_tile
	$Menu.visible = !$Menu.visible
	$AudioStreamPlayer/confirm.play()

func _on_Camera_Mode_Button_pressed():
	can_save_png = true
	$AudioStreamPlayer/confirm.play()
	get_viewport().transparent_bg = true
	get_parent().get_node("Animatronic").hide()
	get_parent().get_node("UI/TEST_MAP").hide()
	get_parent().get_node("UI/Clear_All_Tiles").hide()
	get_parent().get_node("UI/Item_Select/TabContainer").hide()
	get_parent().get_node("UI/Lightning").hide()
	get_parent().get_node("UI/Hide_Spawnpoint").hide()
	get_parent().get_node("UI/BG_Music").hide()
	get_parent().get_node("UI/BG_Music2").hide()
	get_parent().get_node("UI/ColorRect").hide()
	get_parent().get_node("UI/MENU_BUTTON").hide()
	get_parent().get_node("UI/Camera_Mode_Button").hide()
	get_parent().get_node("Editor_Object/Sprite").hide()
	get_parent().get_node("UI/SP_Button").hide()
	get_parent().get_node("UI/GUARD_Button").hide()
	get_parent().get_node("UI/brush_button").hide()
	get_parent().get_node("UI/ST_Button").hide()
	pass # Replace with function body.

func exit_camera_mode():
	can_save_png = false
	$AudioStreamPlayer/camera.play()
	get_viewport().transparent_bg = false
	get_parent().get_node("Animatronic").show()
	get_parent().get_node("UI/TEST_MAP").show()
	get_parent().get_node("UI/Clear_All_Tiles").show()
	get_parent().get_node("UI/Item_Select/TabContainer").show()
	get_parent().get_node("UI/Lightning").show()
	get_parent().get_node("UI/Hide_Spawnpoint").show()
	get_parent().get_node("UI/BG_Music").show()
	get_parent().get_node("UI/BG_Music2").show()
	get_parent().get_node("UI/ColorRect").show()
	get_parent().get_node("UI/MENU_BUTTON").show()
	get_parent().get_node("UI/Camera_Mode_Button").show()
	get_parent().get_node("UI/SP_Button").show()
	get_parent().get_node("UI/GUARD_Button").show()
	get_parent().get_node("UI/brush_button").show()
	get_parent().get_node("UI/ST_Button").show()
	get_parent().get_node("Editor_Object/Sprite").show()
	get_parent().get_node("UI/Camera_Mode_Button/PNG_saved_text").show()
	get_parent().get_node("UI/Camera_Mode_Button/Timer").start()

func _on_ColorRect_mouse_entered():
	Global.place_tile = false

func _on_ColorRect_hide():
	Global.place_tile = true

func _on_Timer_timeout():
	$Camera_Mode_Button/PNG_saved_text.hide()

func _on_Camera_Mode_Button_mouse_entered():
	$Camera_Mode_Button/Press_Space.show()

func _on_Camera_Mode_Button_mouse_exited():
	$Camera_Mode_Button/Press_Space.hide()

func _on_EXIT_EDITOR_pressed():
	get_tree().change_scene("res://scenes/Menu.tscn")

func _on_BG_Music2_pressed():
	Global.lock = false
	$AudioStreamPlayer/confirm.play()
	$Tracks.visible = true

func _on_SP_Button_pressed():
	get_parent().get_node("UI/SP_Pos").popup_centered()
	$AudioStreamPlayer/confirm.play()

func _on_GUARD_Button_pressed():
	get_parent().get_node("UI/Guard").popup_centered()
	$AudioStreamPlayer/confirm.play()

func _on_CC_pressed():
	get_parent().get_node("Guard/Sprite").texture = preload("res://Sprites/Spritesheets/childlol.png")
	get_parent().get_node("Guard/Door1").texture = preload("res://Sprites/Spritesheets/fnaf4door.png")
	get_parent().get_node("Guard/Door2").texture = preload("res://Sprites/Spritesheets/fnaf4door.png")
func _on_MA_pressed():
	get_parent().get_node("Guard/Sprite").texture = preload("res://Sprites/Spritesheets/guardlol.png")
	get_parent().get_node("Guard/Door1").texture = preload("res://Sprites/Doors.tres")
	get_parent().get_node("Guard/Door2").texture = preload("res://Sprites/Doors.tres")
func _on_JF_pressed():
	get_parent().get_node("Guard/Sprite").texture = preload("res://Sprites/Spritesheets/jeremylol.png")
	get_parent().get_node("Guard/Door1").texture = preload("res://Sprites/Doors.tres")
	get_parent().get_node("Guard/Door2").texture = preload("res://Sprites/Doors.tres")
func _on_WA_pressed():
	get_parent().get_node("Guard/Sprite").texture = preload("res://Sprites/Spritesheets/williamlol.png")
	get_parent().get_node("Guard/Door1").texture = preload("res://Sprites/Doors.tres")
	get_parent().get_node("Guard/Door2").texture = preload("res://Sprites/Doors.tres")

func _on_ST_Button_pressed():
	$Settings.popup_centered()
	$AudioStreamPlayer/confirm.play()

func _on_x_value_changed(value):
	get_parent().get_node("Level/Spawnpointx").value = $SP_Pos/x.value 

func _on_y_value_changed(value):
	get_parent().get_node("Level/Spawnpointy").value = $SP_Pos/y.value 

func _on_Guard_x_value_changed(value):
	get_parent().get_node("Level/Guardx").value = $Guard/x.value 

func _on_Guard_y_value_changed(value):
	get_parent().get_node("Level/Guardy").value = $Guard/y.value 

func _on_ColorPicker_color_changed(color):
	 get_parent().get_node("Level/ColorPicker").color = color

func _on_Map_Name_text_changed(new_text):
	 get_parent().get_node("Level/LineEdit").text = new_text

func _on_Author_text_changed(new_text):
	 get_parent().get_node("Level/LineEdit2").text = new_text

func _on_Map_Name3_text_changed(new_text):
	 get_parent().get_node("Level/LineEdit3").text = new_text


func _on_GAME_MODE_LEFT_pressed():
	get_parent().get_node("Level/mode").value -= 1
	$AudioStreamPlayer/confirm.play()

func _on_GAME_MODE_RIGHT_pressed():
	get_parent().get_node("Level/mode").value += 1
	$AudioStreamPlayer/confirm.play()

func _on_Lightning3_pressed():
	$brushsett.popup_centered()
	$AudioStreamPlayer/confirm.play()

func _on_EXIT_EDITOR2_pressed():
	get_tree().change_scene("res://scenes/Gameplay.tscn")
