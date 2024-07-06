extends ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if value >= (value * 0.8):
		add_theme_color_override("theme_override_styles/fill", Color(0, 1,0))
	elif value >= (value * 0.6):
		add_theme_color_override("theme_override_styles/fill", Color(0.5, 1,0))
	elif value >= (value * 0.4):
		add_theme_color_override("theme_override_styles/fill", Color(1, 0.5, 0))
	elif value >= (value * 0.2):
		add_theme_color_override("theme_override_styles/fill", Color(1, 0, 0))
	else:
		add_theme_color_override("theme_override_styles/fill", Color(0, 0, 0))
