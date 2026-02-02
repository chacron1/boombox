extends Sprite2D

@export var beat_curve : Curve
@export var scale_curve : Curve 
@export var anim_strength : float = 0.05

var conductor : Conductor

var _beat : float = 0.0
var _in_between : float = 0.0

func _ready() -> void:
	conductor = %Conductor

func _process(_delta) -> void:
	_beat = floor(conductor.get_current_beat())
	_in_between = conductor.get_current_beat() - _beat
	if !conductor.is_paused:
		var x_value = scale_curve.sample(_in_between) * anim_strength
		var y_value : float = 0.0
		if _in_between >= 0.5:
			y_value = scale_curve.sample(_in_between - 0.5)
		else:
			y_value = scale_curve.sample(_in_between + 0.5)
		scale = Vector2(0.8 + x_value, 0.8 + y_value)
	if beat_curve.sample(_in_between) <= 0.1:
		frame = 0
	

func _input(event):
	if event.is_action_pressed("dancer_left"):
		frame = 3
	if event.is_action_pressed("dancer_up"):
		frame = 5
	if event.is_action_pressed("dancer_right"):
		frame = 4
	if event.is_action_pressed("dancer_down"):
		frame = 2
