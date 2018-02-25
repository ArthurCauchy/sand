extends Spatial

var height = 0
var lamp_moving = false
var time = 0

func _ready():
	$Camera.look_at($Terrain.translation, Vector3(0, 1, 0))
	$UI/ColorPickerButton.color = $Terrain.color

func _process(delta):
	if lamp_moving:
		time += delta
		$Lamp.translation.x = 20 * sin(time);

func _input(event):
	# toggle lamp movement
	if event.is_action_pressed("ui_accept"):
		lamp_moving = not lamp_moving
	# increase terrain height
	if event.is_action_pressed("ui_up") and not event.is_echo() and height <= 9:
		height += 1
		$Terrain.get_surface_material(0).set_shader_param("height_range", height)
	# decrease terrain height
	elif event.is_action_pressed("ui_down") and not event.is_echo() and height >= 1:
		height -= 1
		$Terrain.get_surface_material(0).set_shader_param("height_range", height)
	$UI/HeightFactor.text = "Height Factor: " + str(height)