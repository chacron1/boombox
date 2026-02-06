extends Node

@export var scenario : Scenario
# Load the battle_view
func _ready() -> void:
	var battle_scene = preload("res://assets/views/battle/battle_view.tscn")
	var battle_instance = battle_scene.instantiate()
	battle_instance.setup(scenario)
	add_child(battle_instance)

func _process(_delta) -> void:
	pass
