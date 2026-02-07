extends Label

@export var attack : Accessor:
	set(value):
		value.value_changed.connect(func (x): text = x as StringName)
