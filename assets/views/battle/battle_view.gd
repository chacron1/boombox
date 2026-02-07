@icon("res://assets/views/battle/battle.svg")
class_name BattleView
extends Node

@export var _current_act : Accessor
@export var _act_turns : Accessor
@export var _track_info : TrackInfo

@onready var conductor : Conductor = %Conductor
@onready var enemy : EnemyView = %EnemyView

@export_group("Song parameter accessors")
@export var pitch : Accessor
@export var volume_metronome: Accessor
@export var volume_kick: Accessor
@export var volume_bass: Accessor
@export var volume_lead: Accessor
@export var volume_atmos: Accessor

var _scenario : Scenario
var _act_idx : int = -1

# dependency inject configuration
func setup(scenario : Scenario) -> void:
	_scenario = scenario

func _ready() -> void:
	enemy.setup(_scenario.enemy)
	conductor.player.stream = _scenario.ost
	conductor.bpm = _scenario.bpm
	pitch.value = _scenario.initial_pitch
	_track_info.measure_finished.connect(_on_cycle_complete)
	_next_act()
	conductor.play()

func _process(_delta : float) -> void:
	var act = _current_act.value as Act
	if act.condition.cond():
		_next_act()


func _next_act() -> void:
	if _scenario.acts.size() <= _act_idx:
		printerr("Trying to move past the last act!")
	else:
		_act_idx += 1
		_current_act.value = _scenario.acts[_act_idx]
		_act_turns.value = 0
		_apply_volume_settings()

func _on_cycle_complete(which : int):
	if _act_turns and which == 3:
		_act_turns.value += 1

func _apply_volume_settings():
	var act = _current_act.value as Act
	volume_metronome.value = act.volume_metronome
	volume_kick.value = act.volume_kick
	volume_bass.value = act.volume_bass
	volume_lead.value = act.volume_lead
	volume_atmos.value = act.volume_atmos
