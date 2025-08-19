tool
extends TextureRect

export var background = 0

func _process(delta):
	if background == 0:
		texture = preload("res://Sprites/Backgrounds/bg5.jpg")
	if background == 1:
		texture = preload("res://Sprites/Backgrounds/bg1.jpg")
	if background == 2:
		texture = preload("res://Sprites/Backgrounds/bg2.jpg")
	if background == 3:
		texture = preload("res://Sprites/Backgrounds/bg3.jpg")
	if background == 4:
		texture = preload("res://Sprites/Backgrounds/bg4.jpg")
	if background == 5:
		texture = preload("res://Sprites/Backgrounds/bg9.jpg")
	if background == 6:
		texture = preload("res://Sprites/Backgrounds/bg6.PNG")
	if background == 7:
		texture = preload("res://Sprites/Backgrounds/bg7.jpg")
	if background == 8:
		texture = preload("res://Sprites/Backgrounds/bg8.jpg")
	if background == 9:
		texture = preload("res://Sprites/Backgrounds/bg10.jpg")
	if background == 10:
		texture = preload("res://Sprites/Backgrounds/bg11.png")
	if background == 11:
		texture = preload("res://Sprites/Backgrounds/bg12.jpg")
	if background == 12:
		texture = preload("res://Sprites/Backgrounds/bg14.jpg")
	if background == 13:
		texture = preload("res://Sprites/Backgrounds/bg15.jpeg")
	if background == 14:
		texture = preload("res://Sprites/Backgrounds/bg16.jpg")
