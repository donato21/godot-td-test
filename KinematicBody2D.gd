extends KinematicBody2D

var speed = 20
const MAX_SPEED = 200
var friction = 0.2
var dir = Vector2.ZERO
var last_dir = Vector2.ZERO
var vel = Vector2.ZERO

func _physics_process(_delta):
	last_dir = dir
	if Input.is_action_pressed("ui_up"):
		dir.y -= 1
	elif Input.is_action_pressed("ui_down"):
		dir.y += 1
	if Input.is_action_pressed("ui_left"):
		dir.x -= 1
	elif Input.is_action_pressed("ui_right"):
		dir.x += 1
	
	if dir == last_dir:
		vel = vel.linear_interpolate(Vector2.ZERO, friction)
		dir = Vector2.ZERO
	else:
		vel = dir * speed
	vel = move_and_slide(vel)
