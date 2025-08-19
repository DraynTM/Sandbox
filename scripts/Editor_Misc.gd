extends Node2D

var can_place = true
var is_panning = true;
onready var level = get_parent().get_node("Level")
onready var editor = get_parent().get_node("cam_container")

onready var tile_map : TileMap = get_parent().get_node("Level/TileMap2") #тайлы | tiles
onready var misc_map : TileMap = get_parent().get_node("Level/TileMap") #декорации | misc


var current_item

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = get_global_mouse_position()
	
	if !Global.place_tile:
		if(current_item != null and can_place and Input.is_action_just_pressed("mb_left")):
			var new_item = current_item.instance()
			level.add_child(new_item)
			new_item.global_position = get_global_mouse_position()
	else:
		if(can_place):
			if Input.is_action_pressed("mb_left"):
				place_tile()
			if Input.is_action_pressed("mb_right"):
				remove_tile()
	

func place_tile(): #поставить тайлы
	var mousepos = tile_map.world_to_map(get_global_mouse_position()) #позиция мыши
	tile_map.set_cell(mousepos.x,mousepos.y,Global.current_tile) #поставить блок
	tile_map.update_bitmask_region(mousepos + Vector2(-2,-2), mousepos + Vector2(2, 2)) #обновление автотайлов

func remove_tile(): #удалить тайлы
	var mousepos = tile_map.world_to_map(get_global_mouse_position()) #позиция мыши | mouse position
	var mousepos2 = misc_map.world_to_map(get_global_mouse_position())
	tile_map.set_cell(mousepos.x,mousepos.y,-1) #удалить блоки | remove blocks
	tile_map.update_bitmask_region(mousepos + Vector2(-2,-2), mousepos + Vector2(2, 2)) #обновление автотайлов | updating autotiles
	misc_map.set_cell(mousepos2.x,mousepos2.y,-1) #удалить декорации | remove misc
