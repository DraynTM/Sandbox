extends Control

func _ready():
	pass # Replace with function body.

func _process(delta):
	$TabContainer/Video/VBoxContainer/FPS.text = "FPS: " + str(Engine.get_frames_per_second()) #счётчик фпс
#	if $TabContainer/Video/VBoxContainer/FullScreen.pressed == true: #вкл и выкл фулл скрина
#		OS.window_fullscreen = true
#	if $TabContainer/Video/VBoxContainer/FullScreen.pressed == false:
#		OS.window_fullscreen = false
#	if $TabContainer/Video/VBoxContainer/VSync.pressed == true: #вкл и выкл в.синхронизации
#		OS.vsync_enabled = true
#	if $TabContainer/Video/VBoxContainer/VSync.pressed == false:
#		OS.vsync_enabled = false
