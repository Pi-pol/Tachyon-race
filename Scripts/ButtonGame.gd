extends Node2D

signal door_keycard_reader_pressed

func _on_action_fild_area_entered(area):
	var player = get_node("TileMap/Player")
	if player.inventory = "keycard":
		$AudioStreamPlayer2D.play()
		await get_tree().create_timer(0.7).timeout
		door_button_pressed.emit()
		queue_free()
	else:
		pass
