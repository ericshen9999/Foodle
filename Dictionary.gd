extends Node

var zoomCount
var maxCount
var nodeImage
var currentImage

func _ready() -> void:
	nodeImage = get_node("/root/Main/Background/Food Image")
	zoomCount = 1
	currentImage = 1
	maxCount = nodeImage.getMax()

func checkGuess(input):
	if(false):
		pass
	else:
		zoomCount += 1
		nodeImage.zoom(zoomCount)
		if (zoomCount >= maxCount):
			failedImage()

func failedImage():
	zoomCount = 1
	currentImage += 1
	nodeImage.changeImage(currentImage)
	if (currentImage >= 2):
		currentImage = 0
