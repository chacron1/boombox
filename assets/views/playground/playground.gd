extends CanvasLayer

@export var point_curve : Curve 
@export var beat_curve : Curve 
@export var scale_curve : Curve 
@export var c_rect : ColorRect

var conductor : Conductor
var boombox : Node3D

var _beat : float = 0.0
var _in_between : float = 0.0

func _ready() -> void:
	boombox = %boombox
	c_rect = %BGMetronome
	conductor = %Conductor
	conductor.play()

func _process(_delta) -> void:
	_beat = floor(conductor.get_current_beat())
	_in_between = conductor.get_current_beat() - _beat
	if !conductor.is_paused:
		var p_value = point_curve.sample(_in_between)
		var x_value = scale_curve.sample(_in_between) * 0.7
		var y_value : float = 0.0
		if _in_between >= 0.5:
			y_value = scale_curve.sample(_in_between - 0.5)
		else:
			y_value = scale_curve.sample(_in_between + 0.5)
		c_rect.color = Color(p_value, p_value, p_value, 1.0)
		boombox.scale = Vector3(x_value, y_value, x_value)

func _input(event):
	_beat = floor(conductor.get_current_beat())
	_in_between = conductor.get_current_beat() - _beat
	if event.is_pressed():
		print(conductor.get_current_beat())
		print(_in_between)
		print(point_curve.sample(_in_between))
		if point_curve.sample(_in_between) >= 1.0:
			print("Perfect!")
		elif point_curve.sample(_in_between) >= 0.5:
			print("Good Enough!")
		elif point_curve.sample(_in_between) >= 0.0:
			print("Meh!")
		else:
			print("Too bad!")
