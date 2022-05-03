extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var zoomPhase = 1
var maxZoom = 6
var initScale
# Called when the node enters the scene tree for the first time.

func _ready():
	#Middle zoom
	calcZoom()
	initScale = scale
	scale /= ((1.0 / maxZoom) * zoomPhase)
	pass # Replace with function body.


func zoomOut():
	print(zoomPhase)
	zoomPhase += 1
	calcZoom()
	scale = initScale
	scale /= ((1.0 / maxZoom) * zoomPhase)
	if zoomPhase == maxZoom:
		zoomPhase = 1

func calcZoom():
	region_rect = Rect2(
	texture.get_width() / 2 * (0.167 * (6 - zoomPhase)), 
	texture.get_width() / 2 * (0.167 * (6 - zoomPhase)), 
	texture.get_width() * (0.167 * zoomPhase), 
	texture.get_width() * (0.167 * zoomPhase))
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
