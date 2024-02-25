extends StaticBody2D
class_name ItemContainer

signal open(pos, direction)

@onready var current_direction: Vector2 = Vector2.DOWN.rotated(rotation)

func hit():
	$LidSprite.hide()
	var pos = $SpawnPositions.get_child(randi()%$SpawnPositions.get_child_count()).global_position
	open.emit(pos, current_direction)
