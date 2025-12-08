extends Area2D

class_name Player

@export var moveSpeed: float = 75

var direction: Vector2 = Vector2.ZERO

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var raycasts: Raycasts = $Raycasts

var movement: Vector2 = Vector2.ZERO

func _process(delta: float) -> void:
	var collisions = raycasts.check_collisions()
	if collisions.has(movement):
		return
	position += direction * delta * moveSpeed

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("down"):
		animated_sprite_2d.play("walk_down")
		direction = Vector2.DOWN
	elif Input.is_action_pressed("up"):
		animated_sprite_2d.play("walk_up")
		direction = Vector2.UP
	elif Input.is_action_pressed("left"):
		animated_sprite_2d.play("walk_left")
		direction = Vector2.LEFT
	elif Input.is_action_pressed("right"):
		animated_sprite_2d.play("walk_right")
		direction = Vector2.RIGHT
	else:
		animated_sprite_2d.stop()
		direction = Vector2.ZERO
