extends Label

# Variable to keep track of the score
var score: int = 0

# Function to increment score when a mob is squashed
func _on_mob_squashed():
	# Update the score
	score += 1
	# Update the text display
	text = "Score: %s" % score
