extends KinematicBody2D

var is_disabled = false
var speed = 140
var velocity = Vector2()

func get_input():
	if is_disabled :
		return
    # Detect up/down/left/right keystate and only move when pressed.
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
	    velocity.x += 1
	if Input.is_action_pressed('ui_left'):
	    velocity.x -= 1
	if Input.is_action_pressed('ui_down'):
	    velocity.y += 1
	if Input.is_action_pressed('ui_up'):
	    velocity.y -= 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	move_and_collide(velocity * delta)

func _ready():
	disable()

func disable():
	if is_disabled :
		return
	
	is_disabled = true

func enable():
	is_disabled = false

func _on_TimerEnablePlayer_timeout():
	enable()
