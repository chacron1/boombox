class_name EnemyHPLessThanCond
extends FinishCond

@export_range(0.0, 1.0) var hp_threshold : float

# TODO - add a reference to enemy hp and fix the cond

func cond() -> bool:
	return false
