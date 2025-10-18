extends Button

@export_enum("Left Trigger", "Right Trigger") var trigger: String = "Left Trigger"
func _get_trigger():
    return JOY_AXIS_TRIGGER_LEFT if trigger == "Left Trigger" else JOY_AXIS_TRIGGER_RIGHT

func _on_pressed():
    Input.joy_adaptive_triggers_off(0, _get_trigger())
