extends ColorRect
var hasended =false
func _process(delta):
	if (hasended):
		modulate.a -=1


func _on_player_camera_dead():
	hasended =true
