extends Button




func _on_pressed():
	print(get_name())
	
	if get_name()=="Button2":
		
		get_tree().change_scene_to_file("res://node_2d.tscn")
	elif get_name()=="Button5":
		print("nu bine")
		get_tree().change_scene_to_file("res://main_meno.tscn")
