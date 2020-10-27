extends Node2D
export (PackedScene) var Nuke
export (PackedScene) var AntiNuke

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed:
		var mousePosition = get_viewport().get_mouse_position()
		print(mousePosition)
		var antiNuke = AntiNuke.instance()
		antiNuke.position = Vector2(512, 570)
		antiNuke.target = mousePosition
		add_child(antiNuke)






func _on_NukeSpawner_timeout():
	$NukePath/NukeSpawnLocation.offset = randi()
	var nuke = Nuke.instance()
	add_child(nuke)
	var direction = $NukePath/NukeSpawnLocation.rotation + PI / 2
	nuke.position = $NukePath/NukeSpawnLocation.position
	
	direction += rand_range(-PI / 4, PI / 4)
	nuke.rotation = direction
	
	nuke.linear_velocity = Vector2(rand_range(nuke.min_speed,nuke.max_speed),0)
	nuke.linear_velocity = nuke.linear_velocity.rotated(direction)
