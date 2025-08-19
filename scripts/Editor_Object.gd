extends Node2D
var square_size = 1
var eraser_size = 1
var can_cam_move = true
var can_place = true
var can_place_misc = true
var can_place_trigger = true
var is_panning = true;
var do_save = false
var in_editor = true
var chase_mode = true
var chase = false
var mos_posx = 0
var mos_posy = 0
#Undo Redo Stuff
var doList = []
var doPointer = -1

var path : = PoolVector2Array()
onready var map_name : LineEdit = get_parent().get_node("Level/LineEdit")
onready var author : LineEdit = get_parent().get_node("Level/LineEdit2")
onready var description : LineEdit = get_parent().get_node("Level/LineEdit3")
onready var posx : SpinBox = get_parent().get_node("Level/Spawnpointx")
onready var posy : SpinBox = get_parent().get_node("Level/Spawnpointy")
onready var posxguard : SpinBox = get_parent().get_node("Level/Guardx")
onready var posyguard : SpinBox = get_parent().get_node("Level/Guardy")
onready var amb : SpinBox = get_parent().get_node("Level/amb")
onready var mode : SpinBox = get_parent().get_node("Level/mode")
onready var ambient_color : ColorPicker = get_parent().get_node("Level/ColorPicker")
onready var object_cursor = get_node("/root/main/Editor_Object")
onready var cursor_sprite = object_cursor.get_node("Sprite")
onready var bg_music = get_parent().get_node("UI/BG_Music")
onready var ambient = get_parent().get_node("UI/AudioStreamPlayer/Ambient")
onready var dark_bg = get_parent().get_node("BG/Dark")
onready var level: Navigation2D = get_parent().get_node("Level")
onready var editor = get_parent().get_node("cam_container")
onready var editor_cam = get_parent().get_node("cam_container/Camera2D")
onready var pos = get_parent().get_node("Spawnpoint")
onready var tile_map : TileMap = get_parent().get_node("Level/TileMap") #тайлы | tiles
onready var misc_map : TileMap = get_parent().get_node("Level/TileMap2") #декорации | misc
onready var trigger_map : TileMap = get_parent().get_node("Level/TileMap3") #триггеры | triggers
onready var popup : FileDialog = get_parent().get_node("UI/Menu/FileDialog")
onready var popup2 : FileDialog = get_parent().get_node("UI/Menu/FileDialog2")
onready var paz: Line2D = get_parent().get_node("Line2D")
onready var obj: KinematicBody2D = get_parent().get_node("Animatronic")
onready var enemy: KinematicBody2D = get_parent().get_node("KinematicBody2D")
export var DMTTC = preload("res://Audio//Music//Drag Me to the Crusher.mp3")
export var TFN = preload("res://Audio//Music//The forbidden Nocturne_2.mp3")
export var TCC = preload("res://Audio//Music//Turtle CrusherC.wav")
export var rain = preload("res://Audio//Music//rain.mp3")
export var winds = preload("res://Audio//Music//winds.mp3")
export var night = preload("res://audio/Music/noch-neskolko-sverchkov-34043.ogg")
export var sb = preload("res://audio/Music/FNAF Security Breach - Ambience.mp3")
export var frost = preload("res://audio/Music/FNAF AR Special Delivery - Frost Plushtrap Ambience Music.mp3")
export var du = preload("res://audio/Sounds/Desolate_Underworld2.ogg")
export var wdd = preload("res://audio/Music/Where Dreams Die.mp3")
export var dark = preload("res://audio/Music/Dark amb v4.wav")
export var ambpeople = preload("res://audio/Music/amb_people.mp3")
export var cam_spd = 4 #скорость камеры | camera speed
var current_item #packed scene to plac

func _ready():
	Engine.time_scale = 1
	get_parent().get_node("Animatronic/Area2D").add_to_group("jump")
	get_parent().get_node("Guard/Sprite/Area2D").add_to_group("jump")
	Global.place_tile = true
	editor_cam.current = true
	cam_spd = 4
	dark_bg.hide()
	get_parent().get_node("Guard").can_noise = false
	get_parent().get_node("Animatronic").can_move = false
	get_parent().get_node("JUMPSCARE/Animatronic/abilities").can_use_ability = false
	get_parent().get_node("Animatronic/abilities").can_use_ability = false
	get_parent().get_node("UI/AudioStreamPlayer/Fade").play("Audio Fade")
	get_parent().get_node("Animatronic/Camera2D").current = false
	get_parent().get_node("Animatronic").show()
	get_parent().get_node("Animatronic").speed = 0
	get_parent().get_node("UI/TEST_MAP").show()
	get_parent().get_node("UI/Clear_All_Tiles").show()
	get_parent().get_node("UI/Item_Select/TabContainer").show()
	get_parent().get_node("UI/Lightning").show()
	get_parent().get_node("UI/Hide_Spawnpoint").show()
	get_parent().get_node("UI/BG_Music").show()
	get_parent().get_node("UI/EDIT MAP").hide()
	get_parent().get_node("Guard/CanvasLayer/AWER").hide()
	get_parent().get_node("Guard/CanvasLayer/NOISE").hide()
	get_parent().get_node("Guard/CanvasLayer/CAM").hide()
	get_parent().get_node("JUMPSCARE/Win_Screen/back").show()
	get_parent().get_node("Animatronic/HUD/Abilities").hide()
	get_parent().get_node("JUMPSCARE/Animatronic/HUD/Abilities").hide()
	get_parent().get_node("Countdown/Timer").stop()
	get_parent().get_node("Lose_Screen/Control/ITE").show()
	get_parent().get_node("Countdown/CD").hide()

func _process(delta):
	#EditorPlugin.get_undo_redo
	#print(do_save)
	global_position = get_global_mouse_position()
	if !Global.place_tile:
		if(current_item != null and can_place and Input.is_action_just_pressed("mb_left")):
			var new_item = current_item.instance()
			level.add_child(new_item)
			new_item.owner = level
			new_item.global_position = get_global_mouse_position() 
	else:
		if(can_place):
			if (Global.lock):
				if (Global.another_locker):
					if Input.is_action_pressed("mb_left"):
						place_tile()
					if Input.is_action_pressed("mb_right"):
						remove_tile()
	
		if(can_place_misc):
			if (Global.lock):
				if (Global.another_locker):
					if Input.is_action_pressed("mb_left"):
						place_tile_misc()
					if Input.is_action_pressed("mb_right"):
						remove_tile_misc()
	
		if(can_place_trigger):
			if (Global.lock):
				if (Global.another_locker):
					if Input.is_action_pressed("mb_left"):
						place_tile_trigger()
					if Input.is_action_pressed("mb_right"):
						remove_tile_trigger()
	
	move_editor()
	
	is_panning = Input.is_action_pressed("mb_middle")
	
	if in_editor == true:
		get_parent().get_node("Animatronic").position = pos.position

	if Input.is_action_just_pressed("save"):
		Global.filesystem_shown = true
		do_save = true
		popup.popup_centered()

	if (chase):
		var pathh := level.get_simple_path(enemy.global_position, obj.global_position)
		paz.points = pathh
		enemy.path = pathh

	if (chase_mode):
		enemy.position = get_parent().get_node("Guard").position

	if get_parent().get_node("Level/mode").value == 1:
		get_parent().get_node("Guard/CanvasLayer/CAM").hide()
	square_size = get_parent().get_node("UI/brushsett/size").value
	eraser_size = get_parent().get_node("UI/brushsett/size2").value
#	if Input.is_action_just_pressed("1"):
#		tile_map.set_cell(mos_posx,mos_posy,-1)
#		print(mos_posx)
#		print(mos_posy)
#	if Input.is_action_pressed("save"):
#		Global.filesystem_shown = true
#		popup.window_title = "Save Map"
#		do_save = true
#		popup.mode = 4
#		popup.show()
#	if Input.is_action_pressed("load"):
#		Global.filesystem_shown = true
#		popup.window_title = "Load Map"
#		popup.mode = 0
#		popup.show()
	pass


func place_tile(): #поставить тайлы
	var mousepos = tile_map.world_to_map(get_global_mouse_position())
	tile_map.set_cell(mousepos.x,mousepos.y,Global.current_tile)
	for x in range(square_size):
		for y in range(square_size):
			tile_map.set_cell(mousepos.x + x,mousepos.y + y,Global.current_tile)
			tile_map.update_bitmask_region(mousepos + Vector2(-2,-2), mousepos + Vector2(2, 2)) #обновление автотайлов
			mos_posx = mousepos.x
			mos_posy = mousepos.y

func place_tile_misc(): #поставить декорации
	var mousepos = misc_map.world_to_map(get_global_mouse_position()) #позиция мыши
	misc_map.set_cell(mousepos.x,mousepos.y,Global.current_tile) #поставить декор

func place_tile_trigger(): #поставить триггер
	var mousepos = trigger_map.world_to_map(get_global_mouse_position()) #позиция мыши
	trigger_map.set_cell(mousepos.x,mousepos.y,Global.current_tile) #поставить триггер

func remove_tile(): #удалить тайлы
	var mousepos = tile_map.world_to_map(get_global_mouse_position())
	for x in range(eraser_size):
		for y in range(eraser_size):
			tile_map.set_cell(mousepos.x + x,mousepos.y + y,-1) #удалить блоки | remove blocks
			tile_map.update_bitmask_region(mousepos + Vector2(-2,-2), mousepos + Vector2(2, 2)) #обновление автотайлов | updating autotiles

func remove_tile_misc(): #удалить декорации
	var mousepos = tile_map.world_to_map(get_global_mouse_position()) #позиция мыши | mouse position
	var mousepos2 = misc_map.world_to_map(get_global_mouse_position())
	misc_map.set_cell(mousepos2.x,mousepos2.y,-1) #удалить декорации | remove misc

func remove_tile_trigger(): #удалить триггеры
	var mousepos = tile_map.world_to_map(get_global_mouse_position()) #позиция мыши | mouse position
	var mousepos2 = trigger_map.world_to_map(get_global_mouse_position())
	trigger_map.set_cell(mousepos2.x,mousepos2.y,-1) #удалить триггеры | remove triggers
	
func move_editor():
	if can_cam_move == true:
		if Input.is_action_pressed("w"):
			editor_cam.global_position.y -= cam_spd
		if Input.is_action_pressed("a"):
			editor_cam.global_position.x -= cam_spd
		if Input.is_action_pressed("s"):
			editor_cam.global_position.y += cam_spd
		if Input.is_action_pressed("d"):
			editor_cam.global_position.x += cam_spd
	pass

func _unhandled_input(event):
	if(event is InputEventMouseButton):
		if(event.is_pressed()):
			if(event.button_index == BUTTON_WHEEL_UP):
				editor_cam.zoom -= Vector2(0.1,0.1)
			if(event.button_index == BUTTON_WHEEL_DOWN):
				editor_cam.zoom += Vector2(0.1,0.1)
	if(event is InputEventMouseMotion):
		if(is_panning):
			editor_cam.global_position -= event.relative * editor_cam.zoom
	pass


func _on_Clear_All_Tiles_pressed(): #очистить все тайлы | clear all tiles
	get_parent().get_node("UI/AcceptDialog").popup_centered()

func _on_TEST_MAP_pressed(): #затестить карту | test your own map
	var trophy_request = GameJoltAPI.add_achieved({
	 "username": GameJoltAPI.username,
	 "user_token": GameJoltAPI.user_token,
	 "trophy_id": "158979"
	})
	print("trophy unlocked")
	trophy_request
	
	Global.place_tile = false
	editor_cam.current = false
	in_editor = false
	chase_mode = false
	chase = true
	cam_spd = 0
	dark_bg.show()
	cursor_sprite.hide()
	if get_parent().get_node("Level/mode").value == 0:
		get_parent().get_node("Guard/Timer2").start()
	get_parent().get_node("Guard").can_noise = true
	get_parent().get_node("Animatronic").can_move = true
	get_parent().get_node("UI/AudioStreamPlayer/Fade").play("Audio fade 2")
	get_parent().get_node("Animatronic/Camera2D").current = true
	get_parent().get_node("UI/Hide_Spawnpoint").pressed = true
	get_parent().get_node("Animatronic/abilities").can_use_ability = true
	get_parent().get_node("Animatronic").show()
	get_parent().get_node("Animatronic").speed = 80
	get_parent().get_node("UI/TEST_MAP").hide()
	get_parent().get_node("UI/Clear_All_Tiles").hide()
	get_parent().get_node("UI/Item_Select/TabContainer").hide()
	get_parent().get_node("UI/Lightning").hide()
	get_parent().get_node("UI/Hide_Spawnpoint").hide()
	get_parent().get_node("UI/BG_Music").hide()
	get_parent().get_node("UI/BG_Music2").hide()
	get_parent().get_node("UI/Camera_Mode_Button").hide()
	get_parent().get_node("UI/EDIT MAP").show()
	get_parent().get_node("Guard/CanvasLayer/AWER").show()
	get_parent().get_node("Guard/CanvasLayer/NOISE").show()
	get_parent().get_node("Guard/CanvasLayer/CAM").show()
	get_parent().get_node("Animatronic/HUD/Abilities").show()
	get_parent().get_node("Countdown/Timer").start()
	get_parent().get_node("Countdown/CD").show()
	get_parent().get_node("UI/SP_Button").hide()
	get_parent().get_node("UI/ST_Button").hide()
	get_parent().get_node("UI/GUARD_Button").hide()
	get_parent().get_node("UI/brush_button").hide()
	get_parent().get_node("Level/TileMap3").hide()
	if bg_music.selected == 0:
		ambient.stream = DMTTC
	if bg_music.selected == 1:
		ambient.stream = TFN
	if bg_music.selected == 2:
		ambient.stream = TCC
	if bg_music.selected == 3:
		ambient.stream = rain
	if bg_music.selected == 4:
		ambient.stream = winds
	if bg_music.selected == 5:
		ambient.stream = night
	if bg_music.selected == 6:
		ambient.stream = sb
	if bg_music.selected == 7:
		ambient.stream = frost
	if bg_music.selected == 8:
		ambient.stream = du
	if bg_music.selected == 9:
		ambient.stream = wdd
	if bg_music.selected == 10:
		ambient.stream = dark
	if bg_music.selected == 11:
		ambient.stream = ambpeople

func _on_EDIT_MAP_pressed(): #изменить карту | edit your own map
	Global.place_tile = true
	editor_cam.current = true
	in_editor = true
	chase_mode = true
	chase = false
	cam_spd = 4
	dark_bg.hide()
	cursor_sprite.show()
	Engine.time_scale = 1
	get_parent().get_node("Guard/Timer2").stop()
	get_parent().get_node("Guard/Timer").stop()
	get_parent().get_node("Guard").can_noise = false
	get_parent().get_node("Animatronic").can_move = false
	get_parent().get_node("UI/AudioStreamPlayer/Fade").play("Audio Fade")
	get_parent().get_node("Animatronic/Camera2D").current = false
	get_parent().get_node("Animatronic/abilities").can_use_ability = false
	get_parent().get_node("Animatronic").show()
	get_parent().get_node("Animatronic").speed = 0
	get_parent().get_node("UI/TEST_MAP").show()
	get_parent().get_node("UI/Clear_All_Tiles").show()
	get_parent().get_node("UI/Item_Select/TabContainer").show()
	get_parent().get_node("UI/Lightning").show()
	get_parent().get_node("UI/Hide_Spawnpoint").show()
	get_parent().get_node("UI/BG_Music").show()
	get_parent().get_node("UI/BG_Music2").show()
	get_parent().get_node("UI/Camera_Mode_Button").show()
	get_parent().get_node("UI/EDIT MAP").hide()
	get_parent().get_node("Guard/CanvasLayer/AWER").hide()
	get_parent().get_node("Guard/CanvasLayer/NOISE").hide()
	get_parent().get_node("Guard/CanvasLayer/CAM").hide()
	get_parent().get_node("Animatronic/HUD/Abilities").hide()
	get_parent().get_node("Countdown/Timer").stop()
	get_parent().get_node("Countdown").hours = 0
	get_parent().get_node("Countdown").seconds = 0
	get_parent().get_node("Countdown/CD").hide()
	get_parent().get_node("UI/SP_Button").show()
	get_parent().get_node("UI/ST_Button").show()
	get_parent().get_node("UI/GUARD_Button").show()
	get_parent().get_node("UI/brush_button").show()
	get_parent().get_node("Level/TileMap3").show()

func _on_AcceptDialog_confirmed():
	get_parent().get_node("Level/TileMap").clear()
	get_parent().get_node("Level/TileMap2").clear()
	get_parent().get_node("Level/TileMap3").clear()
	get_parent().get_node("UI/AudioStreamPlayer/save").play()

func _on_SAVE_MAP_pressed():
	get_parent().get_node("UI/AudioStreamPlayer/confirm").play()
	Global.filesystem_shown = true
	do_save = true
	popup.popup()

func _on_LOAD_MAP_pressed():
	get_parent().get_node("UI/AudioStreamPlayer/confirm").play()
	Global.filesystem_shown = true
	popup2.popup()

func _on_FileDialog_hide():
	Global.filesystem_shown = false
	do_save = false

func _on_FileDialog_confirmed():
	var trophy_request = GameJoltAPI.add_achieved({
	 "username": GameJoltAPI.username,
	 "user_token": GameJoltAPI.user_token,
	 "trophy_id": "158974"
	})
	print("trophy unlocked")
	trophy_request
	get_parent().get_node("UI/AudioStreamPlayer/save").play()
	print(do_save)
	save_level()

func save_level():
	var toSave : PackedScene = PackedScene.new()
	tile_map.owner = level
	misc_map.owner = level
	trigger_map.owner = level
	map_name.owner = level
	author.owner = level
	description.owner = level
	posx.owner = level
	posy.owner = level
	posxguard.owner = level
	posyguard.owner = level
	ambient_color.owner = level
	amb.owner = level
	mode.owner = level
	toSave.pack(level)
	print(popup.current_path)
	ResourceSaver.save(popup.current_path + ".tscn", toSave)

func load_level():
	var toLoad : PackedScene = PackedScene.new()
	toLoad = ResourceLoader.load(popup.current_path)
	var this_level = toLoad.instance()
	get_parent().remove_child(level)
	level.queue_free()
	get_parent().add_child(this_level)
	tile_map = get_parent().get_node("Level/TileMap")
	misc_map = get_parent().get_node("Level/TileMap2")
	trigger_map = get_parent().get_node("Level/TileMap3")
	posx = get_parent().get_node("Level/Spawnpointx")
	posy = get_parent().get_node("Level/Spawnpointy")
	posxguard = get_parent().get_node("Level/Guardx")
	posyguard = get_parent().get_node("Level/Guardy")
	ambient_color = get_parent().get_node("Level/ColorPicker")
	map_name = get_parent().get_node("Level/LineEdit")
	author = get_parent().get_node("Level/LineEdit2")
	description = get_parent().get_node("Level/LineEdit3")
	amb = get_parent().get_node("Level/amb")
	mode = get_parent().get_node("Level/mode")
	level = this_level

func _on_FileDialog2_file_selected(path):
	print ("Opening a file...")
	var Load = PackedScene.new()
	get_parent().remove_child(level)
	level.queue_free()
	Load = ResourceLoader.load(path)
	var lvl = Load.instance()
	get_parent().add_child(lvl)
	tile_map = get_parent().get_node("Level/TileMap")
	misc_map = get_parent().get_node("Level/TileMap2")
	trigger_map = get_parent().get_node("Level/TileMap3")
	posx = get_parent().get_node("Level/Spawnpointx")
	posy = get_parent().get_node("Level/Spawnpointy")
	posxguard = get_parent().get_node("Level/Guardx")
	posyguard = get_parent().get_node("Level/Guardy")
	ambient_color = get_parent().get_node("Level/ColorPicker")
	map_name = get_parent().get_node("Level/LineEdit")
	author = get_parent().get_node("Level/LineEdit2")
	description = get_parent().get_node("Level/LineEdit3")
	amb = get_parent().get_node("Level/amb")
	mode = get_parent().get_node("Level/mode")
	level = lvl
	get_parent().get_node("UI/Menu/Path").text = str(path)
	print(path)
	print ("The File Is Open!")
	$Timer.start()
	pass # Replace with function body.

func _on_Timer_timeout():
	pass
