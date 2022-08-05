extends KinematicBody2D
var direction: = Vector2.ZERO
var speed = Vector2(300.0,500.0);
var count = 0
func _physics_process(delta: float) -> void:
	var gravity = 6000
	var velocity = Vector2.ZERO
	
	direction.x = getDirectionX()
	velocity = calculateMovement(velocity,speed,gravity)
	velocity = move_and_slide(velocity, Vector2.UP)

func jump():
	direction.y = -1.0

func getDirectionX():
	return(
		Input.get_action_strength("move_right")- Input.get_action_strength("move_left")
	)
func getDirectionY():
	return (
		Input.get_action_strength("down")
	)
func calculateMovement(velocity,speed,gravity):
	var new_velocity = velocity
	new_velocity.x = speed.x*direction.x
	new_velocity.y += gravity * get_physics_process_delta_time()
	if(direction.y == 1.0):
		new_velocity.y = speed.y * direction.y + speed.y*getDirectionY()
	if(direction.y == -1.0):
		new_velocity.y = speed.y * direction.y
	return new_velocity
func notJump():
	direction.y = 1.0

