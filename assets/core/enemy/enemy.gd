@icon("res://assets/core/enemy/icons/enemy.svg")
class_name Enemy
extends Node3D

@export var anim_curve : Curve
@export var track_info : TrackInfo

func _process(_delta: float) -> void:
	var beat_progress = track_info.beat_progress
	var x_value = anim_curve.sample(beat_progress) * 0.7
	var y_value : float = 0.0
	if beat_progress >= 0.5:
		y_value = anim_curve.sample(beat_progress - 0.5)
	else:
		y_value = anim_curve.sample(beat_progress + 0.5)
	scale = Vector3(x_value, y_value, x_value)
