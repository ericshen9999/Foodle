extends Node

var zoomCount
var maxCount
var nodeImage
var currentImage

var file
var path = "res://FoodDatabase.json"
var data

var monthData = {
	1: 0,
	2: 31,
	3: 59,
	4: 90,
	5: 120,
	6: 151,
	7: 181,
	8: 212,
	9: 243,
	10: 273,
	11: 304,
	12: 334
}
var default_data = {
	"1" : ["Noodle"],
	"2" : ["Dumpling"],
	"132" : ["Ramen"]
}

func _ready() -> void:
	nodeImage = get_node("/root/Main/Background/Food Image")
	zoomCount = 1
	var index = monthData[OS.get_date()["month"]] + OS.get_date()["day"]
	currentImage = index
	nodeImage.changeImage(currentImage)
	maxCount = nodeImage.getMax()
	
	file = File.new()
	if not file.file_exists(path):
		data = default_data.duplicate(true)
		print(data)
		return
	file.open(path, File.READ)
	var text = file.get_as_text()
	data = parse_json(text)
	file.close()
	print(data)
	print(data["1"])
	print(data["1"][0])

func checkGuess(input):
	print(nodeImage.getTexture())
	if(nodeImage.getTexture() == "res://Assets/Foods/0.1.png" or 
		nodeImage.getTexture() == "res://Assets/Foods/0.2.png"):
		nextImage()
	elif(data[str(currentImage)].has(input)):
		nodeImage.changeImagePng("0.2")
	else:
		zoomCount += 1
		nodeImage.zoom(zoomCount)
		if (zoomCount >= maxCount):
			nodeImage.changeImagePng("0.1")

func nextImage():
	#leaving this here until we have a bigger json xd
	zoomCount = 1
	currentImage += 1
	if (currentImage > 2):
		currentImage = 1
	nodeImage.changeImage(currentImage)
