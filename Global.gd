extends Node

var save_file = "user://fnafsandbox-gamejolt.save" #файл сохранения
var gj_nickname = ""
var gj_token = ""
var guards_killed = 0
var time = 0
var gamej = 0
var playing = false
var current_tile = 0
var place_tile = false
var filesystem_shown = false
var can_use_ability = true 
var lock = true
var another_locker = true
var xp = 0
var rank = 1
#var timer
#
#func _ready():
#	load_time()
#	timer = Timer.new()
#	timer.connect("timeout",self,"_on_timer_timeout") 
#	timer.set_wait_time(1) #value is in seconds: 600 seconds = 10 minutes
#	add_child(timer) 
#	timer.start() 
#
#func _on_timer_timeout():
#	time += 1
#	save_time()

func _process(delta):
	if Input.is_action_just_pressed("full_screen"):
		OS.window_fullscreen = !OS.window_fullscreen
	if xp > 0 and xp < 100: #ранг 1
		rank = 1
	if xp > 100 and xp < 200: #ранг 2
		rank = 2
	if xp > 200 and xp < 400: #ранг 3
		rank = 3
	if xp > 400 and xp < 600: #ранг 4
		rank = 4
	if xp > 600 and xp < 800: #ранг 5
		rank = 5
	if xp > 800 and xp < 1200: #ранг 6
		rank = 6
	if xp > 1200 and xp < 1500: #ранг 7
		rank = 7
	if xp > 1500 and xp < 1800: #ранг 8
		rank = 8
	if xp > 1800 and xp < 2200: #ранг 9
		rank = 9
	if xp > 2200 and xp < 2600: #ранг 10
		rank = 10
	if xp > 2600 and xp < 3000: #ранг 11
		rank = 11
	if xp > 3000 and xp < 3500: #ранг 12
		rank = 12
	if xp > 3500 and xp < 4000: #ранг 13
		rank = 13
	if xp > 4000 and xp < 4500: #ранг 14
		rank = 14
	if xp > 4500 and xp < 5000: #ранг 15
		rank = 15
	if xp > 5500 and xp < 6000: #ранг 16
		rank = 16
	if xp > 6000 and xp < 6600: #ранг 17
		rank = 17
	if xp > 6600 and xp < 7200: #ранг 18
		rank = 18
	if xp > 7200 and xp < 7800: #ранг 19
		rank = 19
	if xp > 7800 and xp < 8600: #ранг 20
		rank = 20
	if xp > 8600 and xp < 9400: #ранг 21
		rank = 21
	if xp > 9400 and xp < 10000: #ранг 22
		rank = 22
	if xp > 10000 and xp < 11000: #ранг 23
		rank = 23
	if xp > 11000 and xp < 12000: #ранг 24
		rank = 24
	if xp > 12000 and xp < 13000: #ранг 25
		rank = 25
	if xp > 13000 and xp < 14000: #ранг 26
		rank = 26
	if xp > 14000 and xp < 15000: #ранг 27
		rank = 27
	if xp > 15000 and xp < 17000: #ранг 28
		rank = 28
	if xp > 17000 and xp < 20000: #ранг 29
		rank = 29
	if xp > 20000: #ранг 30
		rank = 30









func save_settings(): #сохранение 
	var file = File.new()
	file.open(save_file, File.WRITE)
	file.store_var(gj_nickname)
	file.store_var(gj_token)
	file.store_var(gamej)
	file.store_var(guards_killed)
	file.store_var(xp)
	file.store_var(rank)
	file.close()

func load_settings(): #загрузка
	var file = File.new()
	if file.file_exists(save_file):
		file.open(save_file, File.READ)
		gj_nickname = file.get_var()
		gj_token = file.get_var()
		gamej = file.get_var()
		guards_killed = file.get_var()
		xp = file.get_var()
		rank = file.get_var()
		file.close()
	else:
		gj_nickname = ""
		gj_token = ""
		gamej = 0
		guards_killed = 0
		xp = 0
		rank = 1
