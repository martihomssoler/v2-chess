class_name Walls

extends Node

var walls_dict = {}

func _ready() -> void:
	var walls = get_tree().get_nodes_in_group("walls")
	for wall in walls:
		wall.position
