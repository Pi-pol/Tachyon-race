extends Node2D

signal door_button2_pressed
@onready var hasCard = false

func _on_action_fild_area_entered(area):
	print(hasCard)
	if hasCard:
		$AudioStreamPlayer2D.play()
		await get_tree().create_timer(0.7).timeout
		door_button2_pressed.emit()
		queue_free()
	


func _on_player_has_keycard(value):
	hasCard = value # Replace with function body.
	print(hasCard)
