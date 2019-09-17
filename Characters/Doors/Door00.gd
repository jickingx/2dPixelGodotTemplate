extends StaticBody2D
signal goto_scene_called
#SIGNALS
#CONST
#ENUM
#ONREADY VARS
#PUBLIC VARS
#PRIVATE VARS

export(String, FILE) var next_scene
export(bool) var is_down_stairs = false 

#EVENTS
func _ready():
	if is_down_stairs:
		$AnimatedSprite.animation = "down"
	else:
		$AnimatedSprite.animation = "default"

func goto_scene():
	$AudioStreamPlayer2D.play()
	#emit signal to set global values (eg: unlock door, set spawn position , scene states)
	emit_signal("goto_scene_called", name)
	Global.goto_scene(next_scene)
	#call_deferred("Global.goto_scene",next_scene)