class_name TriggerController
extends Control

@export_enum("Left Trigger", "Right Trigger") var trigger: String = "Left Trigger"
func _get_trigger():
    return JOY_AXIS_TRIGGER_LEFT if trigger == "Left Trigger" else JOY_AXIS_TRIGGER_RIGHT

func _ready():
    %OffButton.trigger = trigger
    %OffButton.pressed.connect(_on_reset_pressed)
    _on_reset_pressed()

func _process(_delta):
    %Trigger.value = Input.get_action_strength("left_trigger" if trigger == "Left Trigger" else "right_trigger")

func _on_reset_pressed():
    pass