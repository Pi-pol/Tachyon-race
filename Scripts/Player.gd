extends CharacterBody2D

const ACCELERATION = 2000
const MAX_SPEED =300
const FRICTION = 8000
@onready var animationPlayer = $AnimationPlayer
@onready var animationTree =$AnimationTree
func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	
	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/idle/blend_position", input_vector)
		animationTree.set("parameters/run/blend_position", input_vector)
		velocity = velocity.move_toward(input_vector*MAX_SPEED, ACCELERATION*delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO,FRICTION*delta)
	move_and_slide()
	if get_slide_collision_count() > 0:
		var push_vel = Vector2.ZERO
		push_vel = input_vector.normalized()*150
		_check_pushables(push_vel)

func _check_pushables(motion: Vector2) -> void:
	if abs(motion.x) + abs(motion.y) > 1:
		return
	var box := get_slide_collision(0).get_collider() as Box
	if box:
		box.push(motion)
		

func _check_buttonables(motion: Vector2) -> void:
	pass
