@icon("res://assets/core/scenario/icons/act.svg")
class_name Act
extends Resource

@export var is_tutorial : bool
@export var warmup : bool
@export var condition : FinishCond
@export var allowed_choreos : ComboEngine
@export var background : Background
@export var metronome_palette : WavePalette
@export var enemy_attacks : Array[Attack]


@export_group("Track volume")
@export_range(0.0, 1.0) var volume_metronome : float
@export_range(0.0, 1.0) var volume_kick : float
@export_range(0.0, 1.0) var volume_bass : float
@export_range(0.0, 1.0) var volume_lead : float
@export_range(0.0, 1.0) var volume_atmos : float


# TODO : tutorial display message text (if tutorial scene)
