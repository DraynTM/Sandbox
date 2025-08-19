extends Node2D

func _ready():
	pass # Replace with function body.

func _on_Clear_pressed(): #Очистить карту
	$Editor/TileMap.clear()
	$Editor/TileMap2.clear()
