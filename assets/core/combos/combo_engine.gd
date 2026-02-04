@icon("res://assets/core/combos/icons/combo_engine.svg")
class_name ComboEngine
extends Resource

@export var available_choreos : Array[Choreo]
var cst := ChoreoSearchTree.new()

var _compiled := false


func compile() -> void:
	if !_compiled:
		cst._compile(available_choreos)
		_compiled = true


class ChoreoSearchTree extends RefCounted:
	var choreo : Choreo
	var children : Dictionary[StringName, ChoreoSearchTree]


	func add(new_choreo : Choreo, depth : int):
		if depth == new_choreo.choreo.size():
			choreo = new_choreo
			return
		var cst : ChoreoSearchTree = children.get_or_add(new_choreo.choreo[depth].name, ChoreoSearchTree.new())
		cst.add(new_choreo, depth + 1)
	

	func _compile(choreos : Array[Choreo]) -> void:
		for c in choreos:
			add(c, 0)
	

	func find(move : DanceMove) -> ChoreoSearchTree:
		return children.get(move.name)
