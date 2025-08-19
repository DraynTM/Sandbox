extends ScrollContainer

onready var object_cursor = get_node("/root/main/Editor_Object")
# Called when the node enters the scene tree for the first time.
func _ready():
	connect("mouse_entered",self,"mouse_enter")
	connect("mouse_exited",self,"mouse_leave")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func mouse_enter():
	Global.place_tile = false
	#object_cursor.can_place_misc = false
	object_cursor.hide()
	pass
	
func mouse_leave():
	Global.place_tile = true
	#object_cursor.can_place_misc = true
	object_cursor.show()
	pass
