extends TriggerController

func _ready():
    super._ready()

    _update_trigger()
    for i in 9:
        var sl: HSlider = get_node("%%Level%s" % i)
        sl.value_changed.connect(func(_v: float): _update_trigger())

func _on_reset_pressed():
    for i in 9:
        var slider = get_node("%%Level%s" % i)
        slider.value = 0.0

func _update_trigger():
    var arr = _make_array()
    Input.joy_adaptive_triggers_multi_feedback(0, _get_trigger(), arr)

func _make_array():
    var out_array: Array[int] = []
    for i in 10:
        var sl: HSlider = get_node("%%Level%s" % i)
        out_array.append(int(sl.value))
    return out_array
