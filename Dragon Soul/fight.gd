extends Node2D
var health=100
var bosshealth=100
# Called when the node enters the scene tree for the first time.
func _ready():
	$HBoxContainer/Button.grab_focus()
	load_data()
	
var pathfile="res://var.txt"
var checkopen1=0
var sword=0
var posx=0
var posy=0
var armor=0
var checkopen2=0
var healing=0
var checkopen3=0
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	health=$CharacterBody2D.checkHealth()
	$ProgressBar2.value=bosshealth
	$ProgressBar.value=health
	$Label.text="Health : %s" % health
	if health <= 0:
		get_tree().change_scene_to_file("res://Over.tscn")
		$HBoxContainer/mort.play()
		

func load_data():
	if FileAccess.file_exists(pathfile):
		var file=FileAccess.open(pathfile,FileAccess.READ)
		checkopen1=file.get_var()
		sword=file.get_var()
		posx=file.get_var()
		posy=file.get_var()
		armor=file.get_var()
		checkopen2=file.get_var()
		healing=file.get_var()
		checkopen3=file.get_var()
func _on_button_pressed():
	$HBoxContainer/atac.play()
	print (sword)
	if sword == 1:
		bosshealth=bosshealth-25
		print(bosshealth)
	else:
		bosshealth=bosshealth-10
		print(bosshealth)

	if bosshealth==0:
		await get_tree().create_timer(1.0).timeout
		$AspectRatioContainer/VideoStreamPlayer.play()
	else:
		$HBoxContainer.visible=false
		var a =randf_range(0,2)
		$CharacterBody2D.attack_start()
		if a>1:
			await $StaticBody2D.attack2()
		else:
			await $StaticBody2D.send_projectiles()
		$CharacterBody2D.attack_end()
		$HBoxContainer.visible=true
		$HBoxContainer/Button.grab_focus()
		await get_tree().create_timer(1.0).timeout
	
	




func _on_video_stream_player_finished():
	get_tree().change_scene_to_file("res://Ending.tscn")


func _on_button_2_pressed():
	print("ceva")
	health=health+50
	healing=healing-1
