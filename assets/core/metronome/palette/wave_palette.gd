class_name WavePalette
extends Resource

@export_group("First wave colours")
@export var w0 : Array[Color] = [
	Color(0.0, 0.0, 0.0, 0.0),
	Color(0.0, 0.0, 0.0, 0.0),
	Color(0.0, 0.0, 0.0, 0.0),
	Color(0.0, 0.0, 0.0, 0.0),
]
@export_group("Second wave colours")
@export var w1 : Array[Color] = [
	Color(0.0, 0.0, 0.0, 0.0),
	Color(0.0, 0.0, 0.0, 0.0),
	Color(0.0, 0.0, 0.0, 0.0),
	Color(0.0, 0.0, 0.0, 0.0),
]
@export_group("Third wave colours")
@export var w2 : Array[Color] = [
	Color(0.0, 0.0, 0.0, 0.0),
	Color(0.0, 0.0, 0.0, 0.0),
	Color(0.0, 0.0, 0.0, 0.0),
	Color(0.0, 0.0, 0.0, 0.0),
]
@export_group("Fourth wave colours")
@export var w3 : Array[Color] = [
	Color(0.0, 0.0, 0.0, 0.0),
	Color(0.0, 0.0, 0.0, 0.0),
	Color(0.0, 0.0, 0.0, 0.0),
	Color(0.0, 0.0, 0.0, 0.0),
]

func get_wave(n: int) -> Array[Color]:
	match n:
		0:
			return w0
		1:
			return w1
		2:
			return w2
		_:
			return w3

