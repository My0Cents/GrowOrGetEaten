extends Node
@onready var boost_spawn_timer = $BoostSpawnTimer

# Member variables
var enemy_scene:PackedScene = preload("res://scenes/enemy/enemy.tscn")
var spawn_interval = 0.5 # Time in seconds between spawns
var max_enemy_hp = 10
var player # Reference to the player node
@onready var timer = $SpawnTimer

# Called when the node enters the scene tree for the first time
func _ready():
	if Singleton.difficulty == "easy":
		$DifficultyTimer.wait_time = 10
	if Singleton.difficulty == "hard":
		$DifficultyTimer.wait_time = 6
	if Singleton.difficulty == "impossible":
		$DifficultyTimer.wait_time = 3
	
	
	player = get_node("/root/Main/Player") # Adjust the path to your player node
	start_spawning()

# Function to start spawning characters
func start_spawning():
	call_deferred("_spawn_character") # Initial spawn
	timer.wait_time = spawn_interval
	timer.one_shot = false
	timer.timeout.connect(_spawn_character)
	timer.start()

# Function to spawn a character
func _spawn_character():
	var screen_size = get_viewport().size
	timer.wait_time = spawn_interval
	var character = enemy_scene.instantiate()
	character.global_position = get_random_spawn_position()
	var random_vector2 = Vector2(randf_range(0, screen_size.x), randf_range(0, screen_size.y))
	character.velocity = (random_vector2 - character.global_position).normalized()
	character.max_hp = max_enemy_hp
	add_child(character)

# Function to get a random position around the screen for spawning
func get_random_spawn_position():
	var screen_size = get_viewport().size
	var edge = randi() % 4  # Randomly choose an edge: 0 for top, 1 for bottom, 2 for left, 3 for right

	match edge:
		0: # Top edge
			return  Vector2(randf_range(0, screen_size.x), 0)
		1: # Bottom edge
			return  Vector2(randf_range(0, screen_size.x), screen_size.y)
		2: # Left edge
			return  Vector2(0, randf_range(0, screen_size.y))
		3: # Right edge
			return  Vector2(screen_size.x, randf_range(0, screen_size.y))


func _on_timer_timeout():
	spawn_interval*= 0.8
	pass # Replace with function body.


func _on_difficulty_timer_timeout():
	spawn_interval = spawn_interval*0.8
	max_enemy_hp = max_enemy_hp*1.2
	pass # Replace with function body.
