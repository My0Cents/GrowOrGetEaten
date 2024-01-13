extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	if Singleton.score < 20: 
		$GameOverLabel.text = "Game Over, you lost"
	else :
		$GameOverLabel.text = "Congratulations, you won !"
	$ScoreLabel.text = "Score : " + str(Singleton.score)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_try_again_button_pressed():
	get_tree().change_scene_to_file("res://scenes/MainGameScene/main.tscn")
	pass # Replace with function body.


func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu/MainMenu.tscn")
	pass # Replace with function body.
