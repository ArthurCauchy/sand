extends Spatial

var height = 0

func _ready():
	$Camera.look_at($Terrain.translation, Vector3(0, 1, 0))

func _input(event):
	# toggle fullscreen
	if event.is_action_pressed("ui_fullscreen"):
    	OS.window_fullscreen = !OS.window_fullscreen
	# move light
	if event.is_action_pressed("ui_left"):
		$Lamp.translation.x -= 1
	elif event.is_action_pressed("ui_right"):
		$Lamp.translation.x += 1
	elif event.is_action_pressed("ui_up"):
		$Lamp.translation.z -= 1
	elif event.is_action_pressed("ui_down"):
		$Lamp.translation.z += 1
	# increase terrain height
	if event.is_action_pressed("action_heightup") and height < 15:
		height += 1
		$Terrain.get_surface_material(0).set_shader_param("height_range", height)
	# decrease terrain height
	elif event.is_action_pressed("action_heightdown") and height > 0:
		height -= 1
		$Terrain.get_surface_material(0).set_shader_param("height_range", height)
	$UI/HeightFactor.text = "Height Factor: " + str(height)