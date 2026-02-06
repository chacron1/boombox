@icon("res://assets/utils/accessor.svg")
class_name Accessor
extends Resource

signal value_changed(new_value)

@export var value: Variant:
    set(v):
        value = v
        value_changed.emit(value)
