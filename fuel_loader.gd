extends Node2D

signal taken_fuel()

@onready var fuel_in_inv = false
@onready var fuel_in_reactor = 0
@onready var timeout = 1
@onready var time = 0

func _process(delta):
	time += delta

func _on_player_has_fuel(val):
	fuel_in_inv = val


func _on_action_fild_area_entered(area):
	if time < timeout:
		return
	time = 0
	taken_fuel.emit()
	print(fuel_in_reactor)
	if fuel_in_inv:
		fuel_in_reactor += 1
	if fuel_in_reactor >= 4:
		print("yipee")
