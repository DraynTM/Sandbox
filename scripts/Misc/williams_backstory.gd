extends Node2D


func _on_Catch_area_entered(area):
	if $Area2D.overlaps_area($babe/Area2D):
		$Area2D.monitoring = false
		$babe.can_walk = false
		$Scream.play()
		$location.hide()
		$babe/walking.play("catch")
		$Timer.start()
		$CanvasLayer/vhs.hide()
		$elizabeth.hide()

func _on_Scream_timeout():
	print("next")
	$babe.queue_free()
	$WILLIAM/Camera2D.current = true
