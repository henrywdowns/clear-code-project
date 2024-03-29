extends Node2D
class_name LevelParent

var laser_scene: PackedScene = preload("res://projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://projectiles/grenade.tscn")

func _ready():
	$Player/Camera2D.zoom = Vector2(0.4,0.4)

func _on_player_laser_signal(pos, player_direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(player_direction.angle()) + 90
	laser.direction = player_direction
	$Projectiles.add_child(laser)
	$UI.update_laser_text()

func _on_player_grenade_signal(pos,player_direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = player_direction * grenade.speed
	$Projectiles.add_child(grenade)
	$UI.update_grenade_text()


func _on_player_update_stats():
	$UI.update_laser_text()
	$UI.update_grenade_text()
