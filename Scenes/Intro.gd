extends Node2D

export(String, FILE) var next_scene

func _on_Timer_timeout():
	Global.goto_scene(next_scene)
