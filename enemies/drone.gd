extends CharacterBody2D
var pos: Vector2 = Vector2(0,300)
var movement_speed = 150

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = Vector2(1,0)
	velocity = direction * 100
	move_and_slide()

func hit():
	print('damage')
