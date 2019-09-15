extends CanvasLayer

export(String, FILE) var next_scene

func _on_Button_button_up():
	$SoundStart.play()

func _on_SoundStart_finished():
	Global.goto_scene(next_scene)
