extends Node2D

var velocity:Vector2 = Vector2.ZERO
var speed:float = 1.2

@onready var collision_shape_2d = $Area2D/CollisionShape2D
@onready var mesh_instance_2d = $MeshInstance2D

var hp:float = 2
@onready var area_2d = $Area2D


# Called when the node enters the scene tree for the first time
func _ready():
	$Label.text = str(hp)
	collision_shape_2d.shape = CircleShape2D.new()
	collision_shape_2d.shape.radius = hp*4
	pass  # Replace with function body.

# Process input and movement
func _process(delta):
	velocity = Vector2.ZERO  # Reset velocity each frame

	# WASD movement controls
	if Input.is_action_pressed('move_right'):
		velocity.x += 1
	if Input.is_action_pressed('move_left'):
		velocity.x -= 1
	if Input.is_action_pressed('move_up'):
		velocity.y -= 1
	if Input.is_action_pressed('move_down'):
		velocity.y += 1

	# Normalize and apply speed
	velocity = velocity.normalized() * speed
	
	# Move the player
	global_position += velocity.normalized()* speed






func _on_area_2d_area_entered(enemy):
	if enemy.get_parent().hp < hp:
		hp += enemy.get_parent().hp
		$Label.text = str(hp)
		collision_shape_2d.shape.radius = hp*4
		mesh_instance_2d.mesh.size = Vector2(hp*10,hp*10)
		Singleton.score = hp
		enemy.get_parent().queue_free()
		if hp > 20 :
			get_tree().change_scene_to_file("res://scenes/game_over/game_over.tscn")
	else :
		get_tree().change_scene_to_file("res://scenes/game_over/game_over.tscn")
