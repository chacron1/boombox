@icon("res://assets/core/enemy/icons/enemy.svg")
class_name Enemy
extends Node3D

@export var anim_curve : Curve
@export var track_info : TrackInfo:
	set(value):
		track_info = value
		track_info.measure_finished.connect(on_measure_change)

@export var _current_act : Accessor

@export_group("Public variables")
@export var hp : Accessor
@export var last_enemy_attack : Accessor

@export_group("Events")
@export var heal : Accessor:
	set(value):
		value.value_changed.connect(on_heal)

@export var take_dmg : Accessor:
	set(value):
		value.value_changed.connect(on_damage)

@export var do_nothing : Accessor:
	set(value):
		value.value_changed.connect(on_nothing)

@export var dead : Accessor

func _process(_delta: float) -> void:
	var beat_progress = track_info.beat_progress
	var x_value = anim_curve.sample(beat_progress) * 0.7
	var y_value : float = 0.0
	if beat_progress >= 0.5:
		y_value = anim_curve.sample(beat_progress - 0.5)
	else:
		y_value = anim_curve.sample(beat_progress + 0.5)
	scale = Vector3(x_value, y_value, x_value)


func on_measure_change(which : int) -> void:
	if _current_act and which == 1:
		var act = _current_act.value as Act
		if act.enemy_attacks != null and act.enemy_attacks.size() > 0:
			var attack = act.enemy_attacks[randi() % act.enemy_attacks.size()] as Attack
			attack.attack()
			last_enemy_attack.value = attack.display_text


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

func on_nothing(_value : Variant) -> void:
	pass
