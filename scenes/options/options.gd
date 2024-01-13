extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu/MainMenu.tscn")
	pass # Replace with function body.


func _on_option_button_item_selected(index):
	if index == 0:
		Singleton.difficulty = "easy"
	elif index == 1:
		Singleton.difficulty = "hard"
	elif index ==2:
		Singleton.difficulty = "impossible"
	pass # Replace with function body.
