extends CanvasLayer
signal closed

var delta_time = 0
export var speed = 0.1
export(String, MULTILINE) var dialogue_text = ""
export var confirm_action = "ui_accept"
var current_page = 0
var pages = []
var rtLabel

onready var sound = $AudioStreamPlayer

func _ready():
	current_page = 0
	pages = []
	rtLabel = $Container/RichTextLabel
	rtLabel.visible_characters = 0
	rtLabel.bbcode_enabled = true
	
	parse_dialogue_text()
	rtLabel.bbcode_text  = pages[current_page]
	set_process_input(true)
	set_process(true)


func parse_dialogue_text():
	pages = dialogue_text.split(";")
	for i in range(pages.size()):
		pages[i] = pages[i].replace("\n","")


func text_advance():
	if(rtLabel.text.length() == rtLabel.visible_characters):
		current_page = current_page + 1
		rtLabel.visible_characters = 0
		delta_time = 0
		sound.play()
		
		if(pages.size() - 1 >= current_page):
			rtLabel.bbcode_text = align_center( pages[current_page])
		else:
			$Container.visible = false
			emit_signal("closed")


func text_update():
	if(rtLabel.text.length() > rtLabel.visible_characters):
		rtLabel.visible_characters = rtLabel.visible_characters + 1


func align_center(text):
	var x = "[center]" + text + "[/center]"
	return x


func hide():
	$Container.visible = false


func show():
	$Container.visible = true
	sound.play()


func _input(event):
	if(event.is_action_released(confirm_action)):
		if(rtLabel.visible_characters == rtLabel.text.length()):
			text_advance()
		else:
			rtLabel.visible_characters = rtLabel.text.length()


func _process(delta):
	if(delta_time > speed):
		delta_time = 0
		text_update()
	delta_time = delta_time + delta
