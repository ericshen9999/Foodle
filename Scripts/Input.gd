extends LineEdit

func _ready() -> void:
	grab_focus()

func _on_Input_text_entered(inString: String) -> void:
	get_node("/root/Main/Control Node").checkGuess(inString)
