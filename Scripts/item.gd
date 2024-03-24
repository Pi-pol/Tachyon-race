extends Node2D

var time_since_dropped
var threshold = 3

signal itemCollected(Name)

func _ready():
	print("item spawned")
	print(position)
	print(get_parent())
	time_since_dropped = 0
	

func _physics_process(delta):
	time_since_dropped += delta
	

func _on_action_fild_area_entered(area):
	if time_since_dropped >= threshold:
		itemCollected.emit("res://Scenes/item.tscn")
		queue_free()
