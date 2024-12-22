extends Node

# Initialize the sound object globally in JavaScript only when needed
var sound_initialized = false

# Load the Howler.js audio file
func load_sound(path: String, volume: float = 1.0) -> void:
	if not sound_initialized:
		# Initialize the sound object in JavaScript when first loading
		var js_code = """
			var sound = new Howl({
				src: ['""" + path + """'],
				volume: """ + str(volume) + """
			});
		"""
		JavaScript.eval(js_code)
		sound_initialized = true  # Now sound is initialized
	else:
		# Just change the source of the already initialized sound
		var js_code = """
			sound.stop();  // Stop any previously playing sound
			sound = new Howl({
				src: ['""" + path + """'],
				volume: """ + str(volume) + """
			});
		"""
		JavaScript.eval(js_code)

# Play the sound
func play_sound() -> void:
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
