class_name TurnsPassedCond
extends FinishCond

@export var after_turns : int
@export var act_turns : Accessor


func cond() -> bool:
	var turns_passed = act_turns.value as int
	return turns_passed >= after_turns
