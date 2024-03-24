extends Area2D



# Called when the node enters the scene tree for the first time.
var start
@onready var cables = [
	{
		"start": 0,
		"end": 0,
		"connected": false
	},
	{
		"start": 0,
		"end": 0,
		"connected": false
	},
	{
		"start": 0,
		"end": 0,
		"connected": false
	},
	{
		"start": 0,
		"end": 0,
		"connected": false
	},
]
@onready var current_cable = -1
var start_pos = Vector2(0, 0)
func _ready():
	 # Replace with function body.
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass # add drawing
	
func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		if current_cable == -1:
			if (position.y - event.position.y) < 32 and (position.y - event.position.y) > -16:
				if ((position.x - event.position.x) < -99 and (position.x - event.position.x) > -140):
					if not cables[0]["connected"]:
						current_cable = 0
						start_pos = event.position
				elif ((position.x - event.position.x) < -261 and (position.x - event.position.x) > -310):
					current_cable = 1
					start_pos = event.position
				elif ((position.x - event.position.x) < -445 and (position.x - event.position.x) > -510):
					current_cable = 2
					start_pos = event.position
				elif ((position.x - event.position.x) < -630 and (position.x - event.position.x) > -700):
					current_cable = 3
					start_pos = event.position
				else:
					current_cable = -1
				
			elif (position.y - event.position.y) < -460 and (position.y - event.position.y) > -510:
				if ((position.x - event.position.x) < -99 and (position.x - event.position.x) > -140):
					current_cable = 2
					start_pos = event.position
				elif ((position.x - event.position.x) < -261 and (position.x - event.position.x) > -310):
					current_cable = 3
					start_pos = event.position
				elif ((position.x - event.position.x) < -445 and (position.x - event.position.x) > -510):
					current_cable = 1
					start_pos = event.position
				elif ((position.x - event.position.x) < -630 and (position.x - event.position.x) > -700):
					current_cable = 0
					start_pos = event.position
				else:
					current_cable = -1
			else:
				current_cable = -1
		else:
			print("check for con")
			print(start_pos - position)
			print(current_cable)
			print(event.position)
			if (position.y - event.position.y) < 32 and (position.y - event.position.y) > -16:
				print("ok height")
				if ((position.x - event.position.x) < -90 and (position.x - event.position.x) > -140):
					print("ok width")
					if (position.y - start_pos.y < -200) and (current_cable == 0):
						print("0 connected")
						cables[0]["start"] = start_pos
						cables[0]["end"] = event.position
						cables[0]["connected"] = true
				elif ((position.x - event.position.x) < -261 and (position.x - event.position.x) > -310):
					current_cable = 1
				elif ((position.x - event.position.x) < -445 and (position.x - event.position.x) > -510):
					current_cable = 2
				elif ((position.x - event.position.x) < -630 and (position.x - event.position.x) > -700):
					current_cable = 3
			elif (position.y - event.position.y) < -460 and (position.y - event.position.y) > -510:
				if ((position.x - event.position.x) < -99 and (position.x - event.position.x) > -140):
					current_cable = 2
				elif ((position.x - event.position.x) < -261 and (position.x - event.position.x) > -310):
					current_cable = 3
				elif ((position.x - event.position.x) < -445 and (position.x - event.position.x) > -510):
					current_cable = 1
				elif ((position.x - event.position.x) < -630 and (position.x - event.position.x) > -700):
					current_cable = 0
			current_cable = -1
			
		print(position.x - event.position.x)
		
