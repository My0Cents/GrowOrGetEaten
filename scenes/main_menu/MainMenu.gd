extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_2_pressed():
	$Label.visible = true
	await get_tree().create_timer(1).timeout
	$Label.text = "just kidding"
	await get_tree().create_timer(1).timeout
	$Label.visible = false
	get_tree().change_scene_to_file("res://scenes/options/options.tscn")
	
	pass # Replace with function body.


func _on_button_3_pressed():
	$Label2.visible = true
	await get_tree().create_timer(1).timeout
	$Label2.visible = false
	
	pass # Replace with function body.


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/MainGameScene/main.tscn")
	pass # Replace with function body.
