@icon("res://assets/core/scenario/icons/act.svg")
class_name Act
extends Resource

@export var is_tutorial : bool
@export var condition : FinishCond
@export var allowed_choreos : ComboEngine
@export var background : Background
@export var metronome_palette : WavePalette


# TODO : allowed_enemy_attacks : Array[EnemyAttack]
# TODO : tutorial display message text (if tutorial scene)
# TODO : which track should play :
