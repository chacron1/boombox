class_name ComboCheck
extends Node

# TODO:
# - Calculate overall combo
# - Keep track of choreography accuracy
# - launch choreography events
# - Fever mode? 


@export var track_info : TrackInfo
@export var acc_curve : Curve
@export var moves: Array[DanceMove]
@export var combo_engine : ComboEngine:
	set(value):
			combo_engine = value
			combo_engine.compile()
			_current_cst = combo_engine.cst

var _current_cst : ComboEngine.ChoreoSearchTree
var _last_caught_beat : int = -1
var _missed_already : bool = false


func _process(_delta: float) -> void:
	var beat = (track_info.current_beat + roundi(track_info.beat_progress)) % 16
	if beat > 3 and _last_caught_beat >= 0:
		_missed_already = false
		_last_caught_beat = -1
		_current_cst = combo_engine.cst


func _input(event):
	for m in moves:
		if event.is_action_pressed(m.input_action):
			var beat = (track_info.current_beat + roundi(track_info.beat_progress)) % 16
			if beat < 4:
				var accuracy = acc_curve.sample(track_info.beat_progress)
				print(m.name)
				print("Accuracy:")
				print(accuracy)
				if accuracy < 0.0 or _last_caught_beat == beat:
					miss()
				elif !_missed_already:
					print("keep at it!")
					_last_caught_beat = beat
					_current_cst = _current_cst.find(m)
					if !_current_cst:
						print("there's no combo like that")
						miss()
					elif _current_cst.choreo != null:
						combo(_current_cst.choreo)


func miss() -> void:
	_current_cst = combo_engine.cst
	_missed_already = true
	print("miss!")


func combo(choreo : Choreo) -> void:
	print(choreo.name)
