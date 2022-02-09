extends Area2D

var velocity = Vector2.ZERO 
var speed = 1000.0
var damage = 1

func _physics_process(delta):
	position += velocity.rotated(rotation)*delta
	position.x = wrapf(position.x, 0, Global.VP.x)
	position.y = wrapf(position.y, 0, Global.VP.y)
	



func _on_Timer_timeout():
	queue_free()

func _on_Bullet_body_entered(body):
	if body.has_method("damage"):
		body.damage(damage)
	queue_free()
	
