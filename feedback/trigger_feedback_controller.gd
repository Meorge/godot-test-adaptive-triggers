extends TriggerController

func _ready():
    super._ready()
    
    for i in 9:
        var slider = get_node("%%Level%s" % i)
        slider.value_changed.connect(func(v: float):
            Input.joy_adaptive_triggers_feedback(0, _get_trigger(), i, int(v))
        )
        Input.joy_adaptive_triggers_feedback(0, _get_trigger(), i, 0)

func _on_reset_pressed():
    for i in 9:
        var slider = get_node("%%Level%s" % i)
        slider.value = 0.0
