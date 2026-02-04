extends ColorRect

@export var colors : WavePalette
@export var track_info : TrackInfo
@export var sample_curve : Curve
@export var offset : float
@export var wave_length : float = (0.23)

var _last_beat_progress : float = 0.0
var _wave_idx = 3

var w1_color : Color = Color(0.0, 0.0, 0.0, 0.0)
var w2_color : Color = Color(0.0, 0.0, 0.0, 0.0)
var w3_color : Color = Color(0.0, 0.0, 0.0, 0.0)
var w4_color : Color = Color(0.0, 0.0, 0.0, 0.0)

@export_group("Initial distance of each wave")
@export_range(0.0, 1.0) var w1_dist : float = 0.0
@export_range(0.0, 1.0) var w2_dist : float = 0.0
@export_range(0.0, 1.0) var w3_dist : float = 0.0
@export_range(0.0, 1.0) var w4_dist : float = 0.0



func _ready() -> void:
	material.set_shader_parameter("offset", offset)
	material.set_shader_parameter("w1_color", w1_color)
	material.set_shader_parameter("w2_color", w2_color)
	material.set_shader_parameter("w3_color", w3_color)
	material.set_shader_parameter("w4_color", w4_color)
	material.set_shader_parameter("w1_dist", w1_dist)
	material.set_shader_parameter("w2_dist", w2_dist)
	material.set_shader_parameter("w3_dist", w3_dist)
	material.set_shader_parameter("w4_dist", w4_dist)

func _process(_delta) -> void:
	if track_info.is_playing:
		var move = sample_curve.sample(track_info.beat_progress)
		material.set_shader_parameter("move", move)
		
		var new_w1_dist = w1_dist + ((wave_length) * move)
		var new_w2_dist = w2_dist + ((wave_length) * move)
		var new_w3_dist = w3_dist + ((wave_length) * move)
		var new_w4_dist = w4_dist + ((wave_length) * move)

		var current_wave = colors.get_wave(((track_info.measure) % 4))
		
		if _last_beat_progress > track_info.beat_progress:
			w4_color = w3_color
			w3_color = w2_color
			w2_color = w1_color
			w1_color = current_wave[_wave_idx]
			_wave_idx = (_wave_idx + 1) % 4

		_last_beat_progress = track_info.beat_progress

		material.set_shader_parameter("w1_color", w1_color)
		material.set_shader_parameter("w2_color", w2_color)
		material.set_shader_parameter("w3_color", w3_color)
		material.set_shader_parameter("w4_color", w4_color)
		material.set_shader_parameter("w1_dist", new_w1_dist)
		material.set_shader_parameter("w2_dist", new_w2_dist)
		material.set_shader_parameter("w3_dist", new_w3_dist)
		material.set_shader_parameter("w4_dist", new_w4_dist)
