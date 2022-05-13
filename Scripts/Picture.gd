extends Sprite

var maxZoom = 6

func _ready():
	#Intial picture
	calcZoom(1)
	scale = Vector2(300.0/texture.get_width(), 300.0/texture.get_width())
	scale /= ((1.0 / maxZoom) * 1)
	pass

func changeImage(num):
	self.texture = load("res://Assets/Foods/" + str(num) + ".jpg")
	if float(num) > 1:
		get_parent().get_node("Blur").material.set_shader_param('blurSize', 30)
	zoom(1)

func changeImagePng(num):
	self.texture = load("res://Assets/Foods/" + str(num) + ".png")
	zoom(6)

func getTexture():
	return self.texture.resource_path

func zoom(zoomPhase):
	calcZoom(zoomPhase)
	scale = Vector2(300.0/texture.get_width(), 300.0/texture.get_width())
	scale /= ((1.0 / maxZoom) * zoomPhase)
	var currBlur = get_parent().get_node("Blur").material.get_shader_param('blurSize')
	get_parent().get_node("Blur").material.set_shader_param('blurSize', currBlur - 5)
	#Resets the imagine just in case

#Zoom out from the middle
func calcZoom(zoomPhase):
	region_rect = Rect2(
	texture.get_width() / 2.0 * ((1.0 / maxZoom) * (maxZoom - zoomPhase)), 
	texture.get_width() / 2.0 * ((1.0 / maxZoom) * (maxZoom - zoomPhase)), 
	texture.get_width() * ((1.0 / maxZoom) * zoomPhase), 
	texture.get_width() * ((1.0 / maxZoom) * zoomPhase))

func getMax():
	return maxZoom
