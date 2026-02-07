extends Sprite2D


@export var track_info : TrackInfo
@export var anim_curve : Curve 
@export var anim_strength : float
@export var sprites : Array[Sprite2D]
@export var moves: Array[DanceMove]
@export var animation_player : AnimationPlayer


func _process(_delta) -> void:
	if track_info.is_playing:
		var x_value = anim_curve.sample(track_info.beat_progress) * anim_strength
		var y_value : float = 0.0
		if track_info.beat_progress >= 0.5:
			y_value = anim_curve.sample(track_info.beat_progress - 0.5)
		else:
			y_value = anim_curve.sample(track_info.beat_progress + 0.5)
		scale = Vector2(0.8 + x_value, 0.8 + y_value)
		for m in sprites:
			m.scale = Vector2(0.8 + x_value / 2.0, 0.8 + y_value / 2.0)

func _input(event):
	for m in moves:
		if event.is_action_pressed(m.input_action):
			animation_player.play(m.name)
