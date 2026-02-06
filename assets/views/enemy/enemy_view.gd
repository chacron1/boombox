@icon("res://assets/views/enemy/icons/enemy_view.svg")
class_name EnemyView
extends SubViewport


func setup(enemy : PackedScene) -> void:
	var e = enemy.instantiate()
	add_child(e)
