extends LevelParent

func _on_gate_player_entered_gate(_body):
	var tween = create_tween()
	tween.tween_property($Player,"speed",0,.25)
	get_tree().change_scene_to_file("res://levels/inside.tscn")

func _on_small_house_player_entered():
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.tween_property($Player/Camera2D,"zoom",Vector2(.75,.75),1).set_trans(Tween.TRANS_QUAD)

func _on_small_house_player_exited():
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.tween_property($Player/Camera2D,"zoom",Vector2(.5,.5),1).set_trans(Tween.TRANS_QUAD)

