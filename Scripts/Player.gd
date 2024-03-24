extends CharacterBody2D

const ACCELERATION = 2000
const MAX_SPEED = 300
const FRICTION = 8000
var inventory = ""

signal has_keycard(bool)
signal has_fuel(bool)
signal cameraDead()

@onready var alive = true
@onready var steps = []
@onready var time = 20
@onready var animationTree =$AnimationTree
@onready var anim_state =animationTree.get("parameters/playback")
@onready var animation_clock = $Camera2D/AnimationClock

func _physics_process(delta):
	animation_clock.play("ClockAnim")
	if time <= 0 and alive:
		print("kms due to time")
		cameraDead.emit()
		alive = false
		if not alive:
			
			return
	steps.append(position)
	time -= delta
	#print(time)
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
	$AudioStreamPlayer2D.play()
	print(Name)
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
		object.itemCollected.connect(_on_item_item_collected)
	if inventory == "res://Scenes/item.tscn":
		has_keycard.emit(true)
	else:
		has_keycard.emit(false)
		
	if inventory == "fuel":
		has_fuel.emit(true)
	else:
		has_fuel.emit(false)


func _input(event):
	if event is InputEventKey and event.is_pressed():
		if event.keycode == KEY_K:
			alive = false
			$AnimationPlayer.set_current_animation("Kys")
			$AnimationPlayer.advance(0)
			
			
	if not event is InputEventKey:	
		return
	if event.keycode == KEY_R:
		get_tree().change_scene_to_file("res://Scenes/1stlevel.tscn")	
	if event.keycode == KEY_ESCAPE:
		get_tree().change_scene_to_file("res://Scenes/Menu.tscn")	


func _on_button_game_3_item_pickup_area():
	print("fuel pickup")
	_on_item_item_collected("fuel") # Replace with function body.


func _on_button_game_4_taken_fuel():
	if inventory == "fuel":
		inventory = ""


	
