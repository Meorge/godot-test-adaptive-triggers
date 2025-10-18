# DualSense Adaptive Triggers Test Suite for Godot 4.6

This is a minimal Godot project for testing [PR #111682 at godotengine/godot](https://github.com/godotengine/godot/pull/111682), which adds support for the PlayStation 5 DualSense controller's adaptive triggers.

The folders in this project's root directory (with the exception of `off`) each contain a `.tscn` scene file starting with `joy_adaptive_triggers_`, used to test one of the respective API methods:

- `joy_adaptive_triggers_feedback.tscn`
- `joy_adaptive_triggers_multi_feedback.tscn`
- `joy_adaptive_triggers_multi_vibration.tscn`
- `joy_adaptive_triggers_slope_feedback.tscn`
- `joy_adaptive_triggers_vibration.tscn`
- `joy_adaptive_triggers_weapon.tscn`

Run these scenes from the Godot editor using the "Run Current Scene" button with a DualSense controller connected to test the API methods.

> [!warning]
> There is little to no error handling in this project's scripts, for example if no DualSense controller is connected.
