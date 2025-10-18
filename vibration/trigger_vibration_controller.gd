extends TriggerController

@export var single_level_scene: PackedScene

var sliders: Array = []

func _ready():
    super._ready()
    for i in 10:
        var s = single_level_scene.instantiate()
        s.trigger = trigger
        s.trigger_pos = i
        %SliderContainer.add_child(s)
        %SliderContainer.move_child(s, 0)
        sliders.append(s)

func _on_reset_pressed():
    for sl in sliders:
        sl.reset()
