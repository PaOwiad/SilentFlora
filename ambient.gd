extends AudioStreamPlayer

func _ready():
	play()

func _process(delta):
	var playback = get_stream_playback()
	var frames = playback.get_frames_available()
	for i in range(frames):
		var sample = sin(Time.get_ticks_msec() * 0.001) * 0.05
		playback.push_frame(Vector2(sample, sample))
