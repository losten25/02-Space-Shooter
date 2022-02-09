extends Node

var VP = Vector2.ZERO
func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	randomize()
	VP = get_viewport().size
	var _signal = get_tree().get_root().connect("size_changed", self, "_resized")

func _unhandled_input(_event):
	if Input.is_action_pressed("quit"):
		get_tree().quit()


func _resize():
	VP = get_viewport().size
