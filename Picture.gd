extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var zoomPhase = 1
var baseScale
# Called when the node enters the scene tree for the first time.
func _ready():
	baseScale = scale.x
	region_rect = Rect2(texture.get_width()/2 * (0.167 * (6 - zoomPhase)), texture.get_width()/2 * (0.167 * (6 - zoomPhase)), texture.get_width() * (0.167 * zoomPhase), texture.get_height() * (0.167 * zoomPhase))
	scale /= 0.167 * zoomPhase
	pass # Replace with function body.


func zoomOut():
	print(zoomPhase)
	zoomPhase += 1
	region_rect = Rect2(texture.get_width()/2 * (0.167 * (6 - zoomPhase)), texture.get_width()/2 * (0.167 * (6 - zoomPhase)), texture.get_width() * (0.167 * zoomPhase), texture.get_height() * (0.167 * zoomPhase))
	scale.x = 0.25
	scale.y = 0.25
	scale /= 0.167 * zoomPhase
	if zoomPhase == 6:
		zoomPhase = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
