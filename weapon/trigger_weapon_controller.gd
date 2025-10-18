extends TriggerController

func _ready():
    super._ready()

    %StartSlider.value_changed.connect(_on_value_changed)
    %EndSlider.value_changed.connect(_on_value_changed)
    %StrengthSlider.value_changed.connect(_on_value_changed)

func _on_value_changed(_v: float):
    %StartLabel.text = "Start: %s" % int(%StartSlider.value)
    %EndLabel.text = "End: %s" % int(%EndSlider.value)
    %StrengthLabel.text = "Strength: %s" % int(%StrengthSlider.value)

    # Prevent invalid combo of start and end
    if int(%StartSlider.value) >= int(%EndSlider.value):
        return

    Input.joy_adaptive_triggers_weapon(
        0,
        _get_trigger(),
        int(%StartSlider.value),
        int(%EndSlider.value),
        int(%StrengthSlider.value)
    )

func _on_reset_pressed():
    %StartSlider.value = 0.0
    %EndSlider.value = 0.0
    %StrengthSlider.value = 0.0

    %StartLabel.text = "Start: %s" % int(%StartSlider.value)
    %EndLabel.text = "End: %s" % int(%EndSlider.value)
    %StrengthLabel.text = "Strength: %s" % int(%StrengthSlider.value)
