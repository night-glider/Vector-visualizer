extends LineEdit
onready var expression = Expression.new()
onready var result_label = get_parent().get_node("result")
var a = Vector2()
var b = Vector2()

var command = "2 + 2"

func _process(delta):
	a = get_parent().get_parent().get_node("background/centre/vectorA").end
	b = get_parent().get_parent().get_node("background/centre/vectorB").end
	
	var error = expression.parse(command, ["a", "b"])
	if error != OK:
		#print(expression.get_error_text())
		result_label.text = expression.get_error_text()
		return
	var result = expression.execute([a, b], null, true)
	if not expression.has_execute_failed():
		 result_label.text = str(result)
	
	if result is Vector2:
		get_parent().get_parent().get_node("background/centre/vectorX").end = result
		get_parent().get_parent().get_node("background/centre/vectorX").visible = true
	else:
		get_parent().get_parent().get_node("background/centre/vectorX").visible = false

func _on_expression_text_changed(new_text):
	command = new_text
