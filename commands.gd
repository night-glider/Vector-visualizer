extends ItemList

var command_names = []
var command_descriptions = []

func _ready():
	command_names.append("sqrt")
	command_descriptions.append("float sqrt ( float s )\nвозвращает квадратный корень числа s, s должно быть неотрицательным.")
	
	command_names.append("pow")
	command_descriptions.append("float pow ( float base, float exp )\nвозвращает base в степени exp")
	
	for i in 100:
		command_names.append(str(i))
		command_descriptions.append(str(-i))
	
	_on_command_search_text_changed("")


func _on_command_search_text_changed(new_text):
	clear()
	if new_text == "":
		for i in command_names.size():
			add_item(command_names[i], null, false)
			set_item_tooltip(i, command_descriptions[i])
	else:
		var index = 0
		for i in command_names.size():
			if new_text in command_names[i] or new_text in command_descriptions[i]:
				add_item(command_names[i], null, false)
				set_item_tooltip(index, command_descriptions[i])
				index+=1
