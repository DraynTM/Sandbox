extends Control
onready var character = $Animatronic
onready var cam = $Animatronic/Camera2D
onready var texture = $Animatronic/Freddy
func _ready():
	cam.current = false
	$Camera2D.current = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
