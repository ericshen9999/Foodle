extends Node

var zoomCount
var maxCount
var nodeImage
var currentImage

var file
var path = "res://FoodDatabase.json"
var data
var size
var imageCount = 46

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
}

func _ready() -> void:
	nodeImage = get_node("/root/Main/Background/Food Image")
	zoomCount = 1
	var index = monthData[OS.get_date()["month"]] + OS.get_date()["day"] 
	currentImage = (index % imageCount) + 1
	nodeImage.changeImage(currentImage)
	maxCount = nodeImage.getMax()
	
	var dir = Directory.new()
	if dir.open("res://Assets/Foods") == OK:
		dir.list_dir_begin()

		
	file = File.new()
	if not file.file_exists(path):
		data = default_data.duplicate(true)
		print(data)
		return
	
	file.open(path, File.READ)
	data = parse_json(file.get_as_text())
	#data = JSON.parse(file.get_as_text())
	#if(data.error != OK):
	#	printerr("Error %s at line %s: %s" % [data.error, data.error_line, data.error_string])
	file.close()
	print(data)
	print(data[str(currentImage)])
	print(data[str(currentImage)][0])
	
func checkGuess(input):
	print(nodeImage.getTexture())
	if(nodeImage.getTexture() == "res://Assets/Foods/0.1.png" or 
		nodeImage.getTexture() == "res://Assets/Foods/0.2.png"):
		nextImage()
	elif(data[str(currentImage)].has(input.to_upper())):
		nodeImage.changeImagePng("0.2")
	else:
		print("Recieved: " + input + "\nCorrect: " +
			str(data[str(currentImage)]))
		zoomCount += 1
		nodeImage.zoom(zoomCount)
		if (zoomCount >= maxCount):
			nodeImage.changeImagePng("0.1")

func nextImage():
	#leaving this here until we have a bigger json xd
	zoomCount = 1
	currentImage += 1
	if (currentImage > imageCount - 1):
		currentImage = 1
	nodeImage.changeImage(currentImage)
