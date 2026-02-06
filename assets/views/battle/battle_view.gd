@icon("res://assets/views/battle/battle.svg")
class_name BattleView
extends Node

@export var _current_act : Accessor
@export var _act_turns : Accessor
@export var _track_info : TrackInfo

@onready var conductor : Conductor = %Conductor
@onready var enemy : EnemyView = %EnemyView

var _scenario : Scenario
var _act_idx : int = -1

# dependency inject configuration
func setup(scenario : Scenario) -> void:
	_scenario = scenario

func _ready() -> void:
	enemy.setup(_scenario.enemy)
	conductor.player.stream = _scenario.ost
	conductor.bpm = _scenario.bpm
	_track_info.measure_finished.connect(on_cycle_complete)
	next_act()
	conductor.play()

func _process(_delta : float) -> void:
	var act = _current_act.value as Act
	if act.condition.cond():
		next_act()


func next_act() -> void:
	if _scenario.acts.size() <= _act_idx:
		printerr("Trying to move past the last act!")
	else:
		_act_idx += 1
		_current_act.value = _scenario.acts[_act_idx]
		_act_turns.value = 0

func on_cycle_complete(which : int):
	if _act_turns and which == 2:
		_act_turns.value += 1
