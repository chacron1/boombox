extends TextureRect

@export var _current_act : Accessor:
	set(value):
		value.value_changed.connect(change_bg)

func change_bg(value : Variant) -> void:
	# TODO : Animate the change
	var act = value as Act
	texture = act.background.texture
	material = act.background.material
