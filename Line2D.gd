extends Line2D


func _ready():
	set_as_toplevel(true)

func _process(delta):
	add_point(get_parent().global_position)


