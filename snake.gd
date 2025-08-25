class_name Snake

extends Node2D

var body_texture = preload("res://Assets/Snake.png")
@onready var snake_parts: Node = $SnakeParts
@onready var timer = $Timer

var move_direction = Vector2.ZERO
var BODY_SEGMENT_SIZE = 32
var body_parts = []


func _ready() -> void:
	var head = Sprite2D.new()
	head.position = Vector2(0,0)
	head.scale = Vector2(1,1)
	head.texture = body_texture
	snake_parts.add_child(head)
	timer.connect("timeout", on_timeout)
	body_parts.append(head)

func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("right") && move_direction.x != -1):
		move_direction = Vector2.RIGHT
	elif (event.is_action_pressed("left") && move_direction.x != 1):
		move_direction = Vector2.LEFT
	elif (event.is_action_pressed("up") && move_direction.y != 1):
		move_direction = Vector2.UP
	elif (event.is_action_pressed("down") && move_direction.y != -1):
		move_direction = Vector2.DOWN


func on_timeout():
	print("timeoutPrint")
	var new_head_position = position + move_direction * BODY_SEGMENT_SIZE
	move_to_position(new_head_position)


func move_to_position(new_position):
	position = new_position
	body_parts[0].position = new_position
