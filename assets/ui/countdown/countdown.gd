extends Control

@export var track_info : TrackInfo
@export var current_act : Accessor
@export var animation_player : AnimationPlayer
@export var wave_curve : Curve
@export var label : Label


var _last_beat : int = -1
var _play : bool = false

func _ready() -> void:
	track_info.measure_finished.connect(on_measure_finished)
	animation_player.play("pop", -1, 0.0)


func _process(_delta: float) -> void:
	if _play:
		animation_player.seek(track_info.beat_progress)
		if _last_beat != track_info.current_beat:
			print(_last_beat)
			match track_info.current_beat % 4:
				0:
					label.text = "3."
				1:
					label.text = "2."
				2:
					label.text = "1."
				3:
					label.text = "GO !"
			_last_beat = track_info.current_beat


func on_measure_finished(which : int) -> void:
	var act = current_act.value as Act
	if !act.warmup and which == 2:
		_play = true
		_last_beat = track_info.current_beat - 1
	else:
		_play = false
