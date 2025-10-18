extends HBoxContainer

@export_enum("Left Trigger", "Right Trigger") var trigger: String = "Left Trigger"

@export var trigger_pos: int = 0

var amp: int = 0
var freq: int = 0

func _get_trigger():
    return JOY_AXIS_TRIGGER_LEFT if trigger == "Left Trigger" else JOY_AXIS_TRIGGER_RIGHT

func _ready():
    %AmplitudeSlider.value_changed.connect(_on_amp_changed)
    %FreqSlider.value_changed.connect(_on_freq_changed)
    _on_amp_changed(0)
    _on_freq_changed(0)

func reset():
    amp = 0
    freq = 0
    %AmplitudeSlider.value = int(amp)
    %FreqSlider.value = int(freq)
    %AmplitudeLabel.text = "Amp: %s" % amp
    %FreqLabel.text = "Freq: %s" % amp

func _on_amp_changed(v: float):
    %AmplitudeLabel.text = "Amp: %s" % v
    amp = int(v)
    _update_trigger()

func _on_freq_changed(v: float):
    %FreqLabel.text = "Freq: %s" % v
    freq = int(v)
    _update_trigger()

func _update_trigger():
    Input.joy_adaptive_triggers_vibration(0, _get_trigger(), trigger_pos, amp, freq)