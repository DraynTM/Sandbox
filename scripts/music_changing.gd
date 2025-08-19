extends Node2D
export var track = 0
export var Curse_of_Dredbear = preload("res://audio/Music//FNaF Help Wanted - Curse of Dreadbear menu theme.ogg")
export var cn_theme = preload("res://audio//Music//Scott Cawthon - Custom Night Menu.mp3")
export var parish = preload("res://audio//Music//Parish_Inst.ogg")
export var tyfyp = preload("res://audio//Music//FNaF 6 - Thank You For Your Patience (2).mp3")
export var tjoc_theme = preload("res://audio//Music/TJOC RSM - main menu theme.mp3")
export var ttoacw = preload("res://audio//Music//DM DOKURO - The Tale of a Cruel World - Title Theme (1).ogg")
export var fnaf_3_lofi = preload("res://audio//Music//y2mate.com - Die in a Fire The Living Tombstone Lofi Remix.mp3")
export var fnaf_2_lofi = preload("res://audio//Music//Неизвестен - Fnaf Lofi.mp3")
export var daycare = preload("res://audio//Music//Five Night at Freddy's Security Breach OST - Superstar Daycare.mp3")
export var venta_black = preload("res://audio//Music//Five Night at Freddy's Security Breach OST - Vanta Black (Remastered).mp3")
onready var music = get_parent().get_node("AudioStreamPlayer")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print(get_parent().get_node("Tracks").curpath)
	if track == 0:
		music.playing = false
		music.stream = Curse_of_Dredbear
		music.playing = true
	if track == 1:
		music.playing = false
		music.stream = parish
		music.playing = true
	if track== 2:
		music.playing = false
		music.stream = ttoacw
		music.playing = true
	if track == 3:
		music.playing = false
		music.stream = tjoc_theme
		music.playing = true
	if track == 4:
		music.playing = false
		music.stream = cn_theme
		music.playing = true
	if track == 5:
		music.playing = false
		music.stream = tyfyp
		music.playing = true
	if track == 6:
		music.playing = false
		music.stream = fnaf_3_lofi
		music.playing = true
	if track == 7:
		music.playing = false
		music.stream = fnaf_2_lofi
		music.playing = true
	if track == 8:
		music.playing = false
		music.stream = venta_black
		music.playing = true
	if track == 9:
		music.playing = false
		music.stream = daycare
		music.playing = true
	if track == 10:
		music.playing = false
		var pathh = "Z:\\godot_projects\\%s.mp3" % get_parent().get_node("Tracks").curpath
		var ogg_file = File.new()
		ogg_file.open(get_parent().get_node("Tracks").curpath, File.READ)
		var bytes = ogg_file.get_buffer(ogg_file.get_len())
		var stream = AudioStreamMP3.new()
		stream.data = bytes
		music.stream = stream
		ogg_file.close()
		print(get_parent().get_node("Tracks").curpath)
		music.playing = true
		get_parent().get_node("Tracks").save_settings()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _process(delta):
	pass


func _on_Apply_pressed():
	Global.lock = true
	#get_parent().get_node("Faz_Coins").hide()
	get_parent().get_node("Tracks").hide()
	#get_parent().get_node(".").can_menu = true
	if track == 0:
		music.playing = false
		music.stream = Curse_of_Dredbear
		music.playing = true
	if track == 1:
		music.playing = false
		music.stream = parish
		music.playing = true
	if track== 2:
		music.playing = false
		music.stream = ttoacw
		music.playing = true
	if track == 3:
		music.playing = false
		music.stream = tjoc_theme
		music.playing = true
	if track == 4:
		music.playing = false
		music.stream = cn_theme
		music.playing = true
	if track == 5:
		music.playing = false
		music.stream = tyfyp
		music.playing = true
	if track == 6:
		music.playing = false
		music.stream = fnaf_3_lofi
		music.playing = true
	if track == 7:
		music.playing = false
		music.stream = fnaf_2_lofi
		music.playing = true
	if track == 8:
		music.playing = false
		music.stream = venta_black
		music.playing = true
	if track == 9:
		music.playing = false
		music.stream = daycare
		music.playing = true
	if track == 10:
		music.playing = false
		var pathh = "Z:\\godot_projects\\%s.mp3" % get_parent().get_node("Tracks").curpath
		var ogg_file = File.new()
		ogg_file.open(get_parent().get_node("Tracks").curpath, File.READ)
		var bytes = ogg_file.get_buffer(ogg_file.get_len())
		var stream = AudioStreamMP3.new()
		stream.data = bytes
		music.stream = stream
		ogg_file.close()
		print(get_parent().get_node("Tracks").curpath)
		music.playing = true
		get_parent().get_node("Tracks").save_settings()

func _on_FileDialog_file_selected(path):
	get_parent().get_node("Tracks").curpath = str(path)
	track = 10
	get_parent().get_node("Tracks").save_settings()


func _on_AudioStreamPlayer_finished():
	if track == 10:
		if music.playing == false:
			var pathh = "Z:\\godot_projects\\%s.mp3" % get_parent().get_node("Tracks").curpath
			var ogg_file = File.new()
			ogg_file.open(get_parent().get_node("Tracks").curpath, File.READ)
			var bytes = ogg_file.get_buffer(ogg_file.get_len())
			var stream = AudioStreamMP3.new()
			stream.data = bytes
			music.stream = stream
			ogg_file.close()
			print(get_parent().get_node("Tracks").curpath)
			music.playing = true
			get_parent().get_node("Tracks").save_settings()
