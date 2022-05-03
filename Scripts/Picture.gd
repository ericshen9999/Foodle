extends Sprite

var zoomPhase = 1
var maxZoom = 6
var initScale

func _ready():
	#Store inital scale
	initScale = scale
	#Intial picture
	calcZoom()
	scale /= ((1.0 / maxZoom) * zoomPhase)
	pass

func checkGuess():
	if(false):
		pass
	else:
		zoomOut()

func zoomOut():
	#Zooms out of picture
	print(zoomPhase)
	zoomPhase += 1
	calcZoom()
	scale = initScale
	scale /= ((1.0 / maxZoom) * zoomPhase)
	#Resets the imagine just in case
	if zoomPhase == maxZoom:
		zoomPhase = 1
		#Set new picture

#Zoom out from the middle
func calcZoom():
	region_rect = Rect2(
	texture.get_width() / 2 * (0.167 * (6 - zoomPhase)), 
	texture.get_width() / 2 * (0.167 * (6 - zoomPhase)), 
	texture.get_width() * (0.167 * zoomPhase), 
	texture.get_width() * (0.167 * zoomPhase))
