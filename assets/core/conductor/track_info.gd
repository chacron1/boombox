@icon("res://assets/core/conductor/icons/track_info.svg")
class_name TrackInfo
extends Resource

## True when the audio track is actively playing, False when stopped.
@export var is_playing : bool = false
## Current beat position in a 4/4 measure, cycling 0 → 1 → 2 → 3 → 0 …
@export var current_beat : int = 0
## Fractional position between the current and next beat, in [0.0, 1.0). 0.0 = on the beat.
@export var beat_progress : float = 0.0

func reset() -> void:
	current_beat = 0
	beat_progress = 0.0
