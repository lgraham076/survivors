extends Node

const CHUNK_SCENE : String = "res://scenes/chunk.tscn"

@onready var preloader := $ResourcePreloader

var chunk_location := Vector2(0,0)

var chunks = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Player.position = Vector2(0,0)
	chunk_location = Vector2(int($Player.position.x)/128, int($Player.position.y)/128)
	
	generate_tiles()
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Quit"):
		get_tree().quit()
	
	chunk_location = Vector2(int($Player.position.x)/128, int($Player.position.y)/128)
		
	#print(chunk_location)
	
	#generate_tiles()
		

func generate_tiles() -> void:
	for x in range(-2, 3):
		for y in range(-2, 3):
			var chunk = preloader.get_resource("chunk").instantiate()
			var chunk_size = chunk.CHUNK_SIZE.x *2
			var chunk_x = (chunk_location.x + x) * chunk_size
			var chunk_y = (chunk_location.y + y) * chunk_size
			
			print("(" + str(chunk_x) + "," + str(chunk_y) + ")")
			
			chunk.position = Vector2(chunk_x, chunk_y)
			$LoadedChunks.add_child(chunk)
	
	
