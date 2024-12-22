extends Node

var is_playing = false

# Button press handler
func _on_PlayButton_pressed():
	if is_playing:
		HowlerAPI.stop_sound()  # Stop the sound
		$PlayButton.text = "Play Sound"  # Change button text to "Play Sound"
	else:
		HowlerAPI.load_sound("https://jacksonelfersbd0.github.io/ap1/clap.wav", 0.5)  # Replace with your sound path
		HowlerAPI.play_sound()  # Play the sound
		$PlayButton.text = "Stop Sound"  # Change button text to "Stop Sound"
	is_playing = !is_playing

# Initialization function
func _ready():
	# Set the button text initially
	$PlayButton.text = "Play Sound"
	
	# Connect button signal to function
	$PlayButton.connect("pressed", self, "_on_PlayButton_pressed")
