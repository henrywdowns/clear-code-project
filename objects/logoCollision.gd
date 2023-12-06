extends CollisionShape2D

var pos: Vector2 = Vector2.ZERO
const speed: float = 200
#var test_rotation = 0
var var_scale = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pos = Vector2(300,200)
	position = pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pos.x += speed * delta
	position = pos
	#test_rotation += 1
	#rotation_degrees = test_rotation
	#var_scale += 0.002
	scale = Vector2(var_scale,var_scale)
