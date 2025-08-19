extends TextureRect

func _process(delta):
	if Global.rank == 1:
		texture = preload("res://Sprites/Icons/ranks/1.tres")
	if Global.rank > 1 and Global.rank < 4:
		texture = preload("res://Sprites/Icons/ranks/2.tres")
	if Global.rank > 3 and Global.rank < 6:
		texture = preload("res://Sprites/Icons/ranks/3.tres")
	if Global.rank > 5 and Global.rank < 8:
		texture = preload("res://Sprites/Icons/ranks/4.tres")
	if Global.rank > 7 and Global.rank < 10:
		texture = preload("res://Sprites/Icons/ranks/5.tres")
	if Global.rank > 9 and Global.rank < 12:
		texture = preload("res://Sprites/Icons/ranks/6.tres")
	if Global.rank > 11 and Global.rank < 15:
		texture = preload("res://Sprites/Icons/ranks/7.tres")
	if Global.rank > 14 and Global.rank < 18:
		texture = preload("res://Sprites/Icons/ranks/8.tres")
	if Global.rank > 17 and Global.rank < 22:
		texture = preload("res://Sprites/Icons/ranks/9.tres")
	if Global.rank > 21 and Global.rank < 25:
		texture = preload("res://Sprites/Icons/ranks/10.tres")
	if Global.rank > 24 and Global.rank < 30:
		texture = preload("res://Sprites/Icons/ranks/11.tres")
	if Global.rank > 29:
		texture = preload("res://Sprites/Icons/ranks/12.tres")
