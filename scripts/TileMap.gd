extends TileMap
var can_place = true

var current_item

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#global_position = get_global_mouse_position()
	
	if !Global.place_tile:
		if(current_item != null and can_place and Input.is_action_just_pressed("set_tile")):
			var new_item = current_item.instance()
			new_item.global_position = get_global_mouse_position()
	else:
		if(can_place):
			if Input.is_action_pressed("set_tile"):
				place_tile()
			if Input.is_action_pressed("remove_tile"):
				remove_tile()
	
	pass
	
func place_tile():
	var mousepos = world_to_map(get_global_mouse_position())
	set_cell(mousepos.x,mousepos.y,Global.current_tile)

func remove_tile():
	var mousepos = world_to_map(get_global_mouse_position())
	set_cell(mousepos.x,mousepos.y,-1)
