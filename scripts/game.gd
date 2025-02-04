extends Node

const CHUNK_SCENE : String = "res://scenes/chunk.tscn"

var chunks = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Player.position = Vector2(0,0)
	ResourceLoader.load_threaded_request(CHUNK_SCENE)
	var chunk = ResourceLoader.load_threaded_get(CHUNK_SCENE)
	add_child(chunk.instantiate())
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
