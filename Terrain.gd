extends MeshInstance

export(Color, RGBA) var color

func _ready():
	get_surface_material(0).set_shader_param("color", color)


func _on_ColorPickerButton_color_changed( color ):
	get_surface_material(0).set_shader_param("color", color)