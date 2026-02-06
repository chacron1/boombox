@icon("res://assets/core/conductor/icons/track_info.svg")
class_name TrackInfo
extends Resource

signal measure_finished(which : int)

## True when the audio track is actively playing, False when stopped.
@export var is_playing : bool = false
## Current beat position in a 4/4 measure, cycling 0 → 1 → 2 → 3 → .. -> 15 -> 0
@export var current_beat : int:
	set(v):
		if v != current_beat and v % 4 == 0:
			measure_finished.emit(measure)
		current_beat = v

## Fractional position between the current and next beat, in [0.0, 1.0). 0.0 = on the beat.
@export var beat_progress : float = 0.0

var measure : int:
	get:
		return current_beat / 4

func reset() -> void:
	current_beat = 0
	beat_progress = 0.0
