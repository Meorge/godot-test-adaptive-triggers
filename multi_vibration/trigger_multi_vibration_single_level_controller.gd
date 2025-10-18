extends HBoxContainer

signal values_changed()

@export var trigger_pos: int = 0
var amp: int = 0

func _ready():
    %AmplitudeSlider.value_changed.connect(_on_amp_changed)
    %AmplitudeLabel.text = "Amp: %s" % amp
    
func reset():
    amp = 0
    %AmplitudeSlider.value = 0.0
    %AmplitudeLabel.text = "Amp: %s" % amp
    
func _on_amp_changed(v: float):
    amp = int(v)
    %AmplitudeLabel.text = "Amp: %s" % amp
    _update_trigger()

func _update_trigger():
    values_changed.emit()
