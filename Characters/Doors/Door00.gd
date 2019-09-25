extends Area2D
#signal to set global values (eg: unlock door, set spawn position , scene states)
signal goto_scene_called

export(String, FILE) var next_scene
export(bool) var is_down_stairs = false 

func _ready():
	if is_down_stairs:
		$AnimatedSprite.animation = "down"
	else:
		$AnimatedSprite.animation = "default"

func goto_scene():
	pass

func _on_Door00_body_entered(body):
	if body.is_in_group("player"):
		print_debug("Collided with " + body.name)
		$AudioStreamPlayer2D.play()
		if body.has_method("disable"):
			body.disable()

func _on_AudioStreamPlayer2D_finished():
	$AudioStreamPlayer2D.play()
	#emit signal to set global values (eg: unlock door, set spawn position , scene states)
	emit_signal("goto_scene_called", name)
	Global.goto_scene(next_scene)