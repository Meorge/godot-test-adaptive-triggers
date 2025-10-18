extends TriggerController

func _ready():
    super._ready()
    
    %StartSlider.value_changed.connect(_on_value_changed)
    %EndSlider.value_changed.connect(_on_value_changed)
    %StartStrengthSlider.value_changed.connect(_on_value_changed)
    %EndStrengthSlider.value_changed.connect(_on_value_changed)

    _on_reset_pressed()

func _on_value_changed(_v: float):
    %StartLabel.text = "Start: %s" % int(%StartSlider.value)
    %EndLabel.text = "End: %s" % int(%EndSlider.value)
    %StartStrengthLabel.text = "Start strength: %s" % int(%StartStrengthSlider.value)
    %EndStrengthLabel.text = "End strength: %s" % int(%EndStrengthSlider.value)

    # Prevent invalid combo of start and end
    if int(%StartSlider.value) >= int(%EndSlider.value):
        return

    Input.joy_adaptive_triggers_slope_feedback(
        0,
        _get_trigger(),
        int(%StartSlider.value),
        int(%EndSlider.value),
        int(%StartStrengthSlider.value),
        int(%EndStrengthSlider.value)
    )

func _on_reset_pressed():
    %StartSlider.value = 0.0
    %EndSlider.value = 0.0
    %StartStrengthSlider.value = 0.0
    %EndStrengthSlider.value = 0.0

    %StartLabel.text = "Start: %s" % int(%StartSlider.value)
    %EndLabel.text = "End: %s" % int(%EndSlider.value)
    %StartStrengthLabel.text = "Start strength: %s" % int(%StartStrengthSlider.value)
    %EndStrengthLabel.text = "End strength: %s" % int(%EndStrengthSlider.value)
