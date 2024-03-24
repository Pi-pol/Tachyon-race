extends Area2D


# Called when the node enters the scene tree for the first time.
var start
@onready var cables = [
	{
		"staWrt": 0,
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
func _ready():
	 # Replace with function body.
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		if (position.y - event.position.y) < 32 and (position.y - event.position.y) > -16:
			if ((position.x - event.position.x) < -99 and (position.x - event.position.x) > -140):
				print(1)
			if ((position.x - event.position.x) < -261 and (position.x - event.position.x) > -310):
				print(2)
			if ((position.x - event.position.x) < -445 and (position.x - event.position.x) > -510):
				print(3)
			if ((position.x - event.position.x) < -630 and (position.x - event.position.x) > -700):
				print(4)
				
		elif (position.y - event.position.y) < -460 and (position.y - event.position.y) > -510:
			pass
			
		print(position.x - event.position.x)
		
