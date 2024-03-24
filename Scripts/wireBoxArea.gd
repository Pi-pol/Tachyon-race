extends Area2D

signal step_in_zone(bool)

func _on_action_fild_area_entered(area):
	step_in_zone.emit(true)
	print("tak byku")
	
func _on_action_field_area_left(area):
	step_in_zone.emit(false)
	print("spieerdalaj")
