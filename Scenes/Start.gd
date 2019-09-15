extends CanvasLayer

export(String, FILE) var next_scene

func _on_Button_button_up():
	Global.goto_scene(next_scene)