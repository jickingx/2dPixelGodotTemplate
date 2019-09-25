extends CanvasLayer

export(String, FILE) var next_scene

func _on_Button_button_up():
	$SoundStart.play()

func _on_SoundStart_finished():
	Global.goto_scene(next_scene)

func _on_ButtonQuit_button_up():
	get_tree().quit()

func _on_Footer_pressed():
	OS.shell_open("https://www.patreon.com/jickingx")
