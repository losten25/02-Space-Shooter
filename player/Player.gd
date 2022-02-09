extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 5.0
var max_speed = 400.0
var rot_speed = 5.0

var nose = Vector2(0,-60)

var health = 100

func _ready():
	pass
	
func _physics_process(_delta):
	velocity += get_input()*speed
	velocity = velocity.normalized()*clamp(velocity.length(), 0, max_speed)
	velocity = move_and_slide (velocity, Vector2.ZERO)
	position.x = wrapf (position.x, 0.0, Global.VP.x)
	position.y = wrapf (position.y, 0.0, Global.VP.y)
	
func get_input():
	var dir = Vector2.ZERO
	$Exhaust.hide()
	if Input.is_action_pressed("up"):
		dir += Vector2(0,-1)
		$Exhaust.show()
	if Input.is_action_pressed("left"):
		rotation_degrees -= rot_speed
	if Input.is_action_pressed("right"):
		rotation_degrees += rot_speed
	return dir.rotated(rotation)
	


func damage (d):
	health-= d 
	if health <=0:
		queue_free()


func _on_Area2D_body_entered(body):
	if body.name != "Player":
		if body.has_method("damage"):
			body.damage(100)
		damage(100)
	
