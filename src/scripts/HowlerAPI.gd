# HowlerAPI.gd
extends Node

var howler_script = "let sound = null;"

# Load the Howler.js audio file
func load_sound(path: String, volume: float = 1.0) -> void:
	var js_code = """
		if (sound) sound.stop();  // Stop any previously playing sound
		sound = new Howl({
			src: ['""" + path + """'],
			volume: """ + str(volume) + """
		});
	"""
	JavaScript.eval(js_code)

# Play the sound
func play_sound() -> void:
	var js_code = "if (sound) sound.play();"
	JavaScript.eval(js_code)

# Stop the sound
func stop_sound() -> void:
	var js_code = "if (sound) sound.stop();"
	JavaScript.eval(js_code)

# Set the volume
func set_volume(volume: float) -> void:
	var js_code = "if (sound) sound.volume(" + str(volume) + ");"
	JavaScript.eval(js_code)
