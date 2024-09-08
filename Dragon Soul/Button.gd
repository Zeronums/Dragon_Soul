extends Button
var pathfile="res://var.txt"


func _button_pressed():
	if FileAccess.file_exists(pathfile):
		var file=FileAccess.open(pathfile,FileAccess.WRITE)
		file.erase()
		file.close()
		get_tree().change_scene_to_file("res://fight.tscn")


func _on_pressed():
	
	print(get_name())
	if get_name()=="Button":
		if FileAccess.file_exists(pathfile):
			var file=FileAccess.open(pathfile,FileAccess.WRITE)
			file.store_var(0)
			file.store_var(0)
			file.store_var(200)
			file.store_var(400)
			for i in range(20):
				file.store_var(0)
			file.close()
			get_tree().change_scene_to_file("res://node_2d.tscn")
		
	elif get_name()=="Button4":
		
			get_tree().change_scene_to_file("res://fight.tscn")
