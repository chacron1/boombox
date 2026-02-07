extends Control

@export var track_info : TrackInfo
@export var current_act : Accessor
@export var animation_player : AnimationPlayer
@export var wave_curve : Curve
@export var rect : ColorRect
@export var dancer_wave_color : Color
@export var enemy_wave_color : Color

var _measure_progress : float = 0.0
var _starting_beat : int = 0
var _play : bool = false


func _ready() -> void:
	track_info.measure_finished.connect(on_measure_finished)


func _process(_delta: float) -> void:
	_measure_progress = track_info.beat_progress / 4.0 + 0.25 * (track_info.current_beat - _starting_beat)
	if _play:
		rect.material.set_shader_parameter("bounce", wave_curve.sample(track_info.beat_progress) * 2.0 - 1.0)
		animation_player.seek(_measure_progress)


func on_measure_finished(which : int) -> void:
	_measure_progress = 0.0
	_starting_beat = track_info.current_beat + 1
	var act = current_act.value as Act
	if !act.warmup:
		match which:
			0: 
				dancer_attack()
			1:
				enemy_attack()
			_:
				no_attack()


func dancer_attack() -> void:
	rect.material.set_shader_parameter("stripe_color", dancer_wave_color)
	animation_player.play("attack", -1, 0.0)
	_play = true


func enemy_attack() -> void:
	rect.material.set_shader_parameter("stripe_color", enemy_wave_color)
	animation_player.play("enemy_attack", -1, 0.0)
	_play = true


func no_attack() -> void:
	_play = false
