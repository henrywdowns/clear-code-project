extends LevelParent

var PlayerEntered: int = 0

func _on_exit_gate_area_body_entered(_body):
	var tween = create_tween()
	tween.tween_property($Player,"speed",0,.25)
	get_tree().change_scene_to_file("res://levels/outside.tscn")
	

func _on_secret_passage_entrance_body_entered(_body):
	if not PlayerEntered:
		PlayerEntered = 1
	else:
		PlayerEntered = 0
	print("PlayerEntered toggled to ",PlayerEntered)
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	if PlayerEntered == 1:
		tween.tween_property($DirectionalLight2D,"energy",1.25,1).set_trans(Tween.TRANS_QUAD)

	else:
		tween.tween_property($DirectionalLight2D,"energy",0.5,1).set_trans(Tween.TRANS_QUAD)
