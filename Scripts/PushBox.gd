extends Box
class_name PushableBox

func push(inVelocity: Vector2) -> void:
	velocity = inVelocity;
	move_and_slide()
	
	

