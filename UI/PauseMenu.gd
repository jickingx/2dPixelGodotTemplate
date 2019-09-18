extends CanvasLayer
export(String, FILE) var main_menu_scene

func _on_ButtonPause_button_up():
	get_tree().paused = true
	$Popup.show()

func _on_ButtonExit_button_up():
	get_tree().paused = false
	$Popup.hide()


func _on_ButtonMainMenu_button_up():
	#get_tree().change_scene(main_menu_scene)
	Global.goto_scene(main_menu_scene)
