extends Node2D
class_name LevelParent

var laser_scene: PackedScene = preload("res://projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://projectiles/grenade.tscn")
var PlayerEntered: int = 0

func _ready():
	$Player/Camera2D.zoom = Vector2(0.4,0.4)

func _on_player_laser_signal(pos, player_direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(player_direction.angle()) + 90
	laser.direction = player_direction
	$Projectiles.add_child(laser)

func _on_player_grenade_signal(pos,player_direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = player_direction * grenade.speed
	$Projectiles.add_child(grenade)

func _on_secret_passage_entrance_body_entered(body):
	if PlayerEntered == 0:
		PlayerEntered = 1
	else:
		PlayerEntered = 0
	print("PlayerEntered toggled to ",PlayerEntered)
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	if PlayerEntered == 1:
		tween.tween_property($DirectionalLight2D,"energy",12,1).set_trans(Tween.TRANS_QUAD)
	else:
		tween.tween_property($DirectionalLight2D,"energy",0,1).set_trans(Tween.TRANS_QUAD)
