@icon("res://assets/core/dancer/dancer.svg")
class_name Dancer
extends Sprite2D

@export var anim_curve : Curve 
@export var track_info : TrackInfo
@export var anim_strength : float = 0.05
@export var moves: Array[DanceMove]
@export var audio_players : Dictionary[StringName, AudioStreamPlayer]
@export var animation_player : AnimationPlayer

@export_group("Public variables")
@export var hp : Accessor

@export_group("Events")
@export var heal : Accessor:
	set(value):
		value.value_changed.connect(on_heal)

@export var take_dmg : Accessor:
	set(value):
		value.value_changed.connect(on_damage)

@export var dead : Accessor

func _process(_delta) -> void:
	if track_info.is_playing:
		var x_value = anim_curve.sample(track_info.beat_progress) * anim_strength
		var y_value : float = 0.0
		if track_info.beat_progress >= 0.5:
			y_value = anim_curve.sample(track_info.beat_progress - 0.5)
		else:
			y_value = anim_curve.sample(track_info.beat_progress + 0.5)
		scale = Vector2(0.8 + x_value, 0.8 + y_value)
	if track_info.beat_progress >= 0.4 and track_info.beat_progress <= 0.6:
		frame = 0

func _input(event):
	for m in moves:
		if event.is_action_pressed(m.input_action):
			frame = m.anim_index
			audio_players[m.name].play()
			animation_player.play(m.name)


func on_heal(value : Variant) -> void:
	var new = hp.value + value
	if new >= 1.0:
		new = 1.0
	hp.value = new


func on_damage(value : Variant) -> void:
	var new = hp.value - value
	if new <= 0.0:
		new = 0.0
	hp.value = new
	dead.value_changed.emit()
