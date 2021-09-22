tool
extends Node2D
export var vector_name = "X"

var end = Vector2(0,100)

func _ready():
	$end/Label.text = vector_name

func _process(delta):
	$end/edit_x.text = str(end.x)
	$end/edit_y.text = str(end.y)
	
	$end.position = end
	update()

func _draw():
	draw_line(Vector2(), end, Color.blue, 5, false)
