extends Node

# Track whether the audio context is resumed
var audio_context_resumed = false

# Load the Howler.js audio file
func load_sound(path: String, volume: float = 1.0) -> void:
	var js_code = """
		if (typeof sound !== 'undefined') sound.stop();  // Stop any previously playing sound
		sound = new Howl({
			src: ['""" + path + """'],
			volume: """ + str(volume) + """
		});
	"""
	JavaScript.eval(js_code)

# Play the sound
func play_sound() -> void:
	# Ensure that the AudioContext is resumed after a user gesture
	if not audio_context_resumed:
		var js_code = """
			// If the audio context isn't resumed, we resume it after a user gesture
			if (typeof Howler !== 'undefined' && Howler.ctx) {
				Howler.ctx.resume();  // This resumes the AudioContext
			}
		"""
		JavaScript.eval(js_code)
		audio_context_resumed = true  # Mark the audio context as resumed

	# Play the sound
	var js_code = """
		if (typeof sound !== 'undefined') sound.play();
	"""
	JavaScript.eval(js_code)

# Stop the sound
func stop_sound() -> void:
	var js_code = """
		if (typeof sound !== 'undefined') sound.stop();
	"""
	JavaScript.eval(js_code)

# Set the volume
func set_volume(volume: float) -> void:
	var js_code = """
		if (typeof sound !== 'undefined') sound.volume(""" + str(volume) + """);
	"""
	JavaScript.eval(js_code)
