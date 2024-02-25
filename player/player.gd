extends CharacterBody2D
class_name PlayerCharacter


signal laser_signal(pos, player_direction)
signal grenade_signal(pos, player_direction)

var can_laser: bool = true
var can_grenade: bool = true

@export var max_speed: int = 500
var speed: int = max_speed



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	# input
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	if Input.is_action_pressed("run"):
		velocity *= 2.5
		
	move_and_slide()
	
	
	#rotate
	look_at(get_global_mouse_position())

	var player_direction = Vector2(get_global_mouse_position()-position).normalized()
	if Input.is_action_just_pressed("primary action") and can_laser and Globals.laser_ammo > 0:
		Globals.laser_ammo -= 1
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		var pos = selected_laser.global_position
		$GPUParticles2D.emitting = true
		can_laser = false
		$"Laser Timer".start()
		laser_signal.emit(pos, player_direction)
	
	if Input.is_action_just_pressed("secondary action") and can_grenade and Globals.grenade_ammo > 0:
		Globals.grenade_ammo -= 1
		var pos_marker = $LaserStartPositions.get_children()[0]
		var pos = pos_marker.global_position
		
		can_grenade = false
		$"Grenade Timer".start()
		grenade_signal.emit(pos, player_direction)


func _on_laser_timer_timeout():
	print("Laser Timer Timeout")
	can_laser = true # Replace with function body.


func _on_grenade_timer_timeout():
	can_grenade = true # Replace with function body.
	print("Grenade Timer Timeout")
