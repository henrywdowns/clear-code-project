extends Area2D

var rotation_speed: int = 5
var available_options = ['laser','laser','laser','laser','grenade','health']
var type = available_options[randi()%len(available_options)]

func _ready():
	if type == 'laser':
		$Sprite2D.modulate = Color(0.1,0.2,.7)
	if type == 'grenade':
		$Sprite2D.modulate = Color(0.7,0.2,0.1)
	if type == 'health':
		$Sprite2D.modulate = Color(0.1,0.8,0.1)

func _process(delta):
	rotation += rotation_speed * delta

func _on_body_entered(_body):
	queue_free()
	if type == 'health':
		Globals.health += 10
	if type == 'laser':
		Globals.laser_ammo += 5
	if type == 'grenade':
		Globals.grenade_ammo += 1
