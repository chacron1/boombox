@icon("res://assets/core/scenario/icons/scenario.svg")
class_name Scenario
extends Resource

@export var ost : AudioStreamSynchronized
@export var bpm : int
@export var acts : Array[Act]
# TODO : Enemy model resource

var current_act : Act

