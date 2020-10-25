extends Node2D
export (PackedScene) var Nuke

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


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
