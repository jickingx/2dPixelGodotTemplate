extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	#pass # Replace with function body.
	$AnimationPlayer.play("fade")

func fade_out():
	print_debug("fade out")
	$AnimationPlayer.play_backwards("fade")
