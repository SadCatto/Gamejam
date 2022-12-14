extends Node2D


var rabbit =  preload("res://Scenes/Rabbit.tscn")
var particles = preload("res://Scenes/bloodParticles.tscn")

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Globals.rabbitCount<5):
		var rabbitInstance = rabbit.instance()
		var rndNum = rng.randi_range(0,1)
		if(rndNum == 1):
			rabbitInstance.position = $spawnPoints/spawnPoint1.position
		else:
			rabbitInstance.position = $spawnPoints/spawnPoint2.position
		add_child(rabbitInstance)
		Globals.rabbitCount += 1

func addParticles(particlePosition: Vector2):
	$shakeCamera.add_trauma(0.5)
	var parInstance = particles.instance()
	parInstance.position = particlePosition
	add_child(parInstance)
	parInstance.emitting = true
	$Score.updateScore(Globals.score)
	
func tortoiseDead():
	$tryAgainUi.visible = true

func cleanUp():
	Globals.score = 0
	$Score.updateScore(Globals.score)
	var deadPart1 = get_tree().get_root().get_node("tortoiseDead1")
	var deadPart2 = get_tree().get_root().get_node("tortoiseDead2")
	deadPart1.queue_free()
	deadPart2.queue_free()
