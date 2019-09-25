extends Area2D

var is_disabled = false

func _on_Npc00_body_entered(body):
	if is_disabled :
		return
	
	if body.is_in_group("player"):
		print_debug("Collided with " + body.name)
		if body.has_method("disable"):
			body.disable()
		Global.show_simple_dialogue(name)
		is_disabled = true
		$Timer.start()


func _on_Timer_timeout():
	is_disabled = false
	$Timer.stop()
