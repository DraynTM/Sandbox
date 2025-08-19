extends Node2D
var aaa = 0
var chase = false
var chase_mode = false
var path : = PoolVector2Array()
onready var mus = get_parent().get_node("UI/Control/M")
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
onready var ambient = get_parent().get_node("AudioStreamPlayer")
onready var level: Navigation2D = get_parent().get_node("Level")
onready var pos = get_parent().get_node("Spawnpoint")
onready var tile_map : TileMap = get_parent().get_node("Level/TileMap") #тайлы | tiles
onready var misc_map : TileMap = get_parent().get_node("Level/TileMap2") #декорации | misc
onready var trigger_map : TileMap = get_parent().get_node("Level/TileMap3") #триггеры | triggers
onready var popup2 : FileDialog = get_parent().get_node("UI/FileDialog2")
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

func _ready():
	popup2.popup_centered()
	get_parent().get_node("Animatronic").can_move = false
	get_parent().get_node("JUMPSCARE/Animatronic/Camera2D").current = false
	get_parent().get_node("JUMPSCARE/Animatronic/HUD/Abilities").hide()
	get_parent().get_node("JUMPSCARE/Animatronic/abilities").can_use_ability = false
	get_parent().get_node("JUMPSCARE/Win_Screen/back").show()
	get_parent().get_node("JUMPSCARE/Win_Screen/back").text = "Continue playing"
	get_parent().get_node("Countdown").lock = true

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://scenes/Menu.tscn")
	aaa = get_parent().get_node("Level/amb").value
	#print(aaa)
	get_parent().get_node("CanvasModulate").color = get_parent().get_node("Level/ColorPicker").color
	get_parent().get_node("Spawnpoint").position.x = get_parent().get_node("Level/Spawnpointx").value
	get_parent().get_node("Spawnpoint").position.y = get_parent().get_node("Level/Spawnpointy").value
	get_parent().get_node("Guard").position.x = get_parent().get_node("Level/Guardx").value
	get_parent().get_node("Guard").position.y = get_parent().get_node("Level/Guardy").value
	get_parent().get_node("UI/Control/N").text = str(get_parent().get_node("Level/LineEdit").text)
	get_parent().get_node("UI/Control/A").text = "by " + str(get_parent().get_node("Level/LineEdit2").text)
	get_parent().get_node("UI/Control/D").text = "Description: " + str(get_parent().get_node("Level/LineEdit3").text)
	get_parent().get_node("Level/Spawnpointx").hide()
	get_parent().get_node("Level/Spawnpointy").hide()
	get_parent().get_node("Level/Guardx").hide()
	get_parent().get_node("Level/Guardy").hide()
	get_parent().get_node("Level/amb").hide()
	get_parent().get_node("Level/mode").hide()
	#get_parent().get_node("Level/ColorPicker").hide()
	get_parent().get_node("Level/LineEdit").hide()
	get_parent().get_node("Level/LineEdit2").hide()
	get_parent().get_node("Level/LineEdit3").hide()
	get_parent().get_node("Level/TileMap3").hide()

	if (chase):
		var pathh := level.get_simple_path(enemy.global_position, obj.global_position)
		paz.points = pathh
		enemy.path = pathh

	if aaa == 0:
		mus.text = "Music: Drag me to the crusher"
	if aaa == 1:
		mus.text = "Music: The forbidden Nocturne"
	if aaa == 2:
		mus.text = "Music: Turtle CrusherC"
	if aaa == 3:
		mus.text = "Music: Rain ambience"
	if aaa == 4:
		mus.text = "Music: Wind ambience"
	if aaa == 5:
		mus.text = "Music: Night ambient"
	if aaa == 6:
		mus.text = "Music: Security Breach ambience"
	if aaa == 7:
		mus.text = "Music: Frost Ambience"
	if aaa == 8:
		mus.text = "Music: Desolate Underworld"
	if aaa == 9:
		mus.text = "Music: Where Dreams Die"
	if aaa == 10:
		mus.text = "Music: Dark Amb"
	if aaa == 11:
		mus.text = "Music: Amb People"

func load_level():
	var toLoad : PackedScene = PackedScene.new()
	toLoad = ResourceLoader.load(popup2.current_path)
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
	mode = get_parent().get_node("Level/mode")
	level = this_level

func _on_FileDialog2_file_selected(path):
	load_level()
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
	mode = get_parent().get_node("Level/mode")
	level = lvl
	print(path)
	print ("The File Is Open!")
	pass # Replace with function body.

func _on_Play_pressed():
	if get_parent().get_node("Level/mode").value == 0:
		get_parent().get_node("Guard").show()
		get_parent().get_node("KinematicBody2D").hide()
		get_parent().get_node("Guard").guard_type = 0
		get_parent().get_node("KinematicBody2D").mode = 0
		get_parent().get_node("KinematicBody2D/Area2D").monitoring = false
		get_parent().get_node("Guard/Sprite/Area2D").monitoring = true
		get_parent().get_node("Guard/Door1/StaticBody2D").monitoring = true
		get_parent().get_node("Guard/Door2/StaticBody2D").monitoring = true
		get_parent().get_node("Countdown").chaing_mode = false
	if get_parent().get_node("Level/mode").value == 1:
		get_parent().get_node("Guard").hide()
		get_parent().get_node("KinematicBody2D").show()
		get_parent().get_node("Guard").guard_type = 1
		get_parent().get_node("KinematicBody2D").mode = 1
		get_parent().get_node("KinematicBody2D/Area2D").monitoring = true
		get_parent().get_node("Guard/Sprite/Area2D").monitoring = false
		get_parent().get_node("Guard/Door1/StaticBody2D").monitoring = false
		get_parent().get_node("Guard/Door2/StaticBody2D").monitoring = false
		get_parent().get_node("Countdown").chaing_mode = true
	if get_parent().get_node("Level/mode").value == 2:
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


	if get_parent().get_node("Level/mode").value == 1:
		get_parent().get_node("Guard/CanvasLayer/CAM").hide()
	
	get_parent().get_node("Animatronic/abilities").show()
	get_parent().get_node("Animatronic/HUD/Abilities/TextureProgress").show()
	get_parent().get_node("Animatronic/HUD/Abilities").show()
	get_parent().get_node("Animatronic").position = get_parent().get_node("Spawnpoint").position
	get_parent().get_node("UI/Control").hide()
	get_parent().get_node("UI/bg").hide()
	get_parent().get_node("Animatronic").can_move = true
	get_parent().get_node("Countdown").lock = false
	enemy.position = get_parent().get_node("Guard").position
	if get_parent().get_node("Level/mode").value == 0:
		get_parent().get_node("Guard/Timer2").start()
	chase = true
	if aaa == 0:
		ambient.stream = DMTTC
		ambient.play()
	if aaa == 1:
		ambient.stream = TFN
		ambient.play()
	if aaa == 2:
		ambient.stream = TCC
		ambient.play()
	if aaa == 3:
		ambient.stream = rain
		ambient.play()
	if aaa == 4:
		ambient.stream = winds
		ambient.play()
	if aaa == 5:
		ambient.stream = night
		ambient.play()
	if aaa == 6:
		ambient.stream = sb
		ambient.play()
	if aaa == 7:
		ambient.stream = frost
		ambient.play()
	if aaa == 8:
		ambient.stream = du
		ambient.play()
	if aaa == 9:
		ambient.stream = wdd
		ambient.play()
	if aaa == 10:
		ambient.stream = dark
		ambient.play()
	if aaa == 11:
		ambient.stream = ambpeople
		ambient.play()

func _on_Map_Editor_pressed():
	get_tree().change_scene("res://scenes/main.tscn")

func _on_Back_pressed():
	get_tree().change_scene("res://scenes/Menu.tscn")

func _on_Load_Map_pressed():
	popup2.popup_centered()
