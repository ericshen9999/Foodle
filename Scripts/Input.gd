extends LineEdit

func _ready() -> void:
	grab_focus()

func _on_Input_text_entered(inString: String) -> void:
	get_node("/root/Main/Dictionary").checkGuess(inString)
	#get_tree().get_root().get_node("Dictionary").checkGuess(inString)
