tool
extends Node2D

export var vector_name = "a"
var end = Vector2()
var drag = false

func _ready():
	$end/Label.text = vector_name
	
	randomize()
	$end/edit_x.text = str(rand_range(-100, 100))
	$end/edit_y.text = str(rand_range(-100, 100))

func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		if $end.global_position.distance_to(get_global_mouse_position()) < 10:
			drag = true
	
	if Input.is_action_just_released("ui_select"):
		drag = false
	
	if drag:
		$end.global_position = get_global_mouse_position()
		
		$end/edit_x.text = str($end.position.x)
		$end/edit_y.text = str($end.position.y)
	
	$end/edit_x.text = str(int($end/edit_x.text))
	$end/edit_y.text = str(int($end/edit_y.text))
	
	end = Vector2($end/edit_x.text, $end/edit_y.text)
	
	$end.position = end
	update()

func _draw():
	draw_line(Vector2(), end, Color.red, 5, false)
