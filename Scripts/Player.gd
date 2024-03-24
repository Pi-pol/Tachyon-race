extends CharacterBody2D

const ACCELERATION = 2000
const MAX_SPEED =300
const FRICTION = 8000
var inventory = ""
@onready var animationTree =$AnimationTree
@onready var anim_state =animationTree.get("parameters/playback")
func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	input_vector = input_vector.normalized()
	
	
	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/idle/blend_position", input_vector)
		animationTree.set("parameters/run/blend_position", input_vector)
		anim_state.travel("run")
		
		velocity = velocity.move_toward(input_vector*MAX_SPEED, ACCELERATION*delta)
	else:
		anim_state.travel("idle")
		
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
		




func _on_item_item_collected(Name):
	print("Picked up")
	if(inventory==""):
		inventory=Name
	else:
		print(inventory)
		var world = get_node(".")
		var scene = load(inventory)
		var object = scene.instantiate()
		object.position = position
		world.add_sibling(object)
		inventory = Name
		#object.position
		
