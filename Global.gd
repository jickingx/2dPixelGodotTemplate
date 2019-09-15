extends Node

#scenes
var current_scene = null

#scene transition
var screen_overlay = null

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)
	print_debug("current scene: " + current_scene.name)

func goto_scene(path):
	fade_out_transition()
	# This function will usually be called from a signal callback,
	# or some other function in the current scene.
	# The solution is to defer the load to a later time, when
	# we can be sure that no code from the current scene is running:
	#load_json_data()
	#setup_simple_dialogue()
	setup_fade_transition()
	call_deferred("_deferred_goto_scene", path)


func _deferred_goto_scene(path):
	# It is now safe to remove the current scene
	current_scene.free()
	
	# Load the new scene.
	var s = ResourceLoader.load(path)
	
	# Instance the new scene.
	current_scene = s.instance()
	
	# Add it to the active scene, as child of root.
	get_tree().get_root().add_child(current_scene)
	
	# Optionally, to make it compatible with the SceneTree.change_scene() API.
	get_tree().set_current_scene(current_scene)
	#add dialogue to scene
	#setup_simple_dialogue()
	#add fade transition to scene
	setup_fade_transition()

func setup_fade_transition():
	#INTANTIATE 
	var screen_overlay_path = load("res://UI/SCREEN_OVERLAY.tscn")
	var so = screen_overlay_path.instance()
	so.set_name("screen_overlay")
	current_scene.add_child(so)
	screen_overlay = so

func fade_out_transition():
	if screen_overlay != null :
		screen_overlay.fade_out()
