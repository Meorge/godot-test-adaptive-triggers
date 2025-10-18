extends TriggerController

@export var single_level_scene: PackedScene

var amp_sliders: Array = []

func _ready():
    super._ready()

    %FreqSlider.value_changed.connect(_on_freq_changed)
    
    for i in 10:
        var s = single_level_scene.instantiate()
        s.trigger_pos = i
        s.values_changed.connect(_on_values_changed)
        %SliderContainer.add_child(s)
        amp_sliders.insert(0, s)

    _on_freq_changed(0)

func _on_reset_pressed():
    %FreqSlider.value = 0.0
    for sl in amp_sliders:
        sl.reset()

func _on_freq_changed(v: float):
    %FreqLabel.text = "Freq: %s" % v
    _on_values_changed()

func _on_values_changed():
    var amps: Array[int] = []
    for i in 10:
        amps.append(int(amp_sliders[i].amp))
    Input.joy_adaptive_triggers_multi_vibration(0, _get_trigger(), int(%FreqSlider.value), amps)
