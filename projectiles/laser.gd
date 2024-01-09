extends Area2D

signal laser_hit

@export var speed: float = 400
var direction: Vector2 = Vector2.UP
@export var acceleration: float = 1.2
var timer: Timer

func _ready():
	$Timer.start()
	
func _process(delta):
	speed *= acceleration
	position += direction * speed * delta


func _on_body_entered(body):
	print('collision',body)
	queue_free()
	if "hit" in body:
		body.hit()


func _on_timer_timeout():
	queue_free()
