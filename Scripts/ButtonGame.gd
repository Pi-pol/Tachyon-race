extends Node2D

signal door_keycard_reader_pressed

func _on_action_fild_area_entered(area):
	
	$AudioStreamPlayer2D.play()
	await get_tree().create_timer(0.7).timeout
	door_keycard_reader_pressed.emit()
	
