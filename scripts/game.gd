extends Node

const CHUNK_SCENE : String = "res://scenes/chunk.tscn"

@onready var preloader := $ResourcePreloader

var chunk_location := Vector2(0,0)

var chunks = []

func get_current_location():
	
	var x = int($Player.position.x)
	var y = int($Player.position.y)
	
	if x < 0:
		x -= 256
	if y < 0:
		y -= 256
	
	return Vector2(x/256, y/256)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Player.position = Vector2(128,128)
	chunk_location = get_current_location()
	print(chunk_location)
	generate_tiles()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Quit"):
		get_tree().quit()
		return
	
	var current_location = get_current_location()
	if current_location != chunk_location:
		chunk_location = current_location
		generate_tiles()
		print(chunk_location)	

func generate_tiles() -> void:
	for child in $LoadedChunks.get_children():
		$LoadedChunks.remove_child(child)
		child.queue_free()
	
	for x in range(-2, 3):
		for y in range(-2, 3):
			var chunk = preloader.get_resource("chunk").instantiate()
			var chunk_size = chunk.CHUNK_SIZE.x
			var chunk_x = (chunk_location.x + x) * chunk_size
			var chunk_y = (chunk_location.y + y) * chunk_size

			chunk.position = Vector2(chunk_x, chunk_y)
			$LoadedChunks.add_child(chunk)
	
