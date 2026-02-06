class_name TurnsPassedCond
extends FinishCond

@export var turns_passed : int

# TODO - check passed turns (can assume that cond is being checked once a turn?)

func cond() -> bool:
	return false
