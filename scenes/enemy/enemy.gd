extends Node2D

var velocity:Vector2 = Vector2.ZERO
var speed:float = 1

@onready var collision_shape_2d = $Area2D/CollisionShape2D

var hp:float = 2
var max_hp:float = 10

# Called when the node enters the scene tree for the first time
func _ready():
	randomize()
	hp = randi_range(max_hp-9,max_hp)
	$Label.text = str(hp)
	collision_shape_2d.shape = CircleShape2D.new()
	collision_shape_2d.shape.radius = hp*4
	$Sprite2D.scale = $Sprite2D.scale*hp/2


# Process input and movement
func _process(delta):
	
	# Normalize and apply speed
	velocity = velocity.normalized() * speed
	
	# Move the player
	global_position += velocity.normalized()* speed
