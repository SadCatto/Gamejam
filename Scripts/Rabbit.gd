extends KinematicBody2D
var rng = RandomNumberGenerator.new()
var velocity = Vector2.ZERO
var direction = Vector2.ZERO
var speed = Vector2(1000,0)
var timer = Timer.new()

func _physics_process(delta: float) -> void:
	direction = getDirection()
	velocity = getVelocity(direction,speed,velocity)
	velocity = move_and_slide(velocity)
	
func getVelocity(direction,speed,velocity):
	var new_velocity = velocity
	new_velocity = speed*direction
	return new_velocity
	
func getDirection():
	return(
		Vector2(rng.randf_range(-2,2),0)
	)
func _on_Area2D_body_entered(body: Node) -> void:
	if(body.name == 'Tortoise'):
		body.count += 1
		body.jump()

