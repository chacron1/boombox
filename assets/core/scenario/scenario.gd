@icon("res://assets/core/scenario/icons/scenario.svg")
class_name Scenario
extends Resource

@export var ost : AudioStreamSynchronized
@export var bpm : int
@export var acts : Array[Act]
@export var enemy : PackedScene

var current_act : Act

