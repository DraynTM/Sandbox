tool
extends Node2D
export var on = true

func _draw():
	if on: 
		var size = get_viewport_rect().size  * get_parent().get_node("cam_container/Camera2D").zoom / 2
		var cam = get_parent().get_node("cam_container/Camera2D").position
		for i in range(int((cam.x - size.x) / 20) - 1, int((size.x + cam.x) / 20) + 1):
			draw_line(Vector2(i * 20, cam.y + size.y + 200), Vector2(i * 20, cam.y - size.y - 200), "000000")
		for i in range(int((cam.y - size.y) / 20) - 1, int((size.y + cam.y) / 20) + 1):
			draw_line(Vector2(cam.x + size.x + 200, i * 20), Vector2(cam.x - size.x - 200, i * 20), "000000")

func _process(delta):
	update()
