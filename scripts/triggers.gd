extends Node2D
onready var player = get_parent().get_node("Animatronic")
onready var cam = get_parent().get_node("Animatronic/Camera2D")
onready var abil = get_parent().get_node("Animatronic/abilities")
onready var sound = $AudioStreamPlayer
var shake_amount = 1.0
var player_scale_x = 7
var player_scale_y = 7
var cam_zoom_y = 7
var cam_zoom_x = 7
var conveyor_speed = 1

func _process(delta):
	var mp = get_parent().get_node("Animatronic").position
	var tiles = get_parent().get_node("Level/TileMap3")
	var tp = tiles.world_to_map(mp)
	var cid = tiles.get_cellv(tp)
	
	#print(cid)
	if cid == 0:
		cam_shake()
	if cid == 1:
		player.position.x += 200
		sound.stream = preload("res://audio/Sounds/Item6.wav")
		sound.play()
	if cid == 2:
		player.position.y += 200
		sound.stream = preload("res://audio/Sounds/Item6.wav")
		sound.play()
	if cid == 3:
		player.position.x -= conveyor_speed
	if cid == 4:
		player.position.x += conveyor_speed
	if cid == 5:
		player.position.y -= conveyor_speed
	if cid == 6:
		player.position.y += conveyor_speed
	if cid == 7:
		abil.trigger_use = false
	if cid == 15:
		abil.trigger_use = true
	if cid == 8:
		player.scale.x = player_scale_x
		player.scale.y = player_scale_y
	if cid == 9:
		cam.zoom.x = cam_zoom_x
		cam.zoom.y = cam_zoom_y

	if cid == 10:
		shader_glitch()
	if cid == 11:
		shader_chromatic()
	if cid == 12:
		shader_retro()
	if cid == 13:
		shader_vhs()
	if cid == 14:
		shader_clear()

#shaders
func shader_vhs():
	$CanvasLayer/Shader.material = preload("res://shaders/vhs.tres")
	$CanvasLayer/Shader.show()
func shader_retro():
	$CanvasLayer/Shader.material = preload("res://shaders/retro.tres")
	$CanvasLayer/Shader.show()
func shader_glitch():
	$CanvasLayer/Shader.material = preload("res://shaders/glitch.tres")
	$CanvasLayer/Shader.show()
func shader_chromatic():
	$CanvasLayer/Shader.material = preload("res://shaders/chromatic.tres")
	$CanvasLayer/Shader.show()
func shader_clear():
	$CanvasLayer/Shader.hide()

func cam_shake():
	get_parent().get_node("Animatronic/Camera2D").set_offset(Vector2( \
		rand_range(-1.0, 1.0) * shake_amount, \
		rand_range(-1.0, 1.0) * shake_amount \
	))
