@icon("res://assets/core/attack/icons/attack.svg")
class_name Attack
extends Resource

@export var event : Accessor
@export var value : Variant
@export var display_text : StringName

func attack() -> void:
	event.value = value
