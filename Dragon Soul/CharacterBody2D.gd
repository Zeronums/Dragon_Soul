extends CharacterBody2D

var dmg=0
var hp=100
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var val = 0
var val2=0
var val3=0
var checkopen1=0
var checkopen2=0
var checkopen3=0
var pathfile="res://var.txt"
var sword=0
var armor=0
var healing=0
var positions
var positionsx
var positionsy
var simultaneous_scene = preload("res://fight.tscn").instantiate()
func _ready():
	load_data()
	

func _physics_process(delta):
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	var direction1 = Input.get_axis("ui_up", "ui_down")
	if direction1:
		velocity.y = direction1 * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

func _on_area_2d_body_entered(body):
	if position.y<100 and position.y>-100:
		val=1
	if position.y>950:
		val2=1
	if position.y>700 and position.y<900:
		val3=1
	
func _process(delta):
	if velocity==Vector2(0,0):
		$walk.play()
	else :
		return
	positions= get_position()
	positionsx=positions[0]
	positionsy=positions[1]
	#print (positionsx,positionsy)
	if checkopen1==0 :
		if val == 1 and Input.is_action_just_pressed("ui_accept") :
			$AnimationPlayer.play("chest_open")
			$chest.play()
			val = 0
			checkopen1=1
			sword=1
			save()
			$Camera2D/Label.text="You've discovered the SWORD"
			$Camera2D/Label.visible=true
			await get_tree().create_timer(3.0).timeout
			$Camera2D/Label.visible=false
			
	elif val==1 and Input.is_action_just_pressed("ui_accept"):
		$AnimationPlayer.play("chest_open")
		$chest.play()
		$Camera2D/Label.text="This chest was already opened"
		$Camera2D/Label.visible = true
		
	if checkopen2==0 :
		if val2 == 1 and Input.is_action_just_pressed("ui_accept") :
			$AnimationPlayer2.play("chest_open")
			$chest.play()
			val2 = 0
			checkopen2=1
			armor=1
			save()
			$Camera2D/Label.text="You've discovered the ARMOR"
			$Camera2D/Label.visible=true
			await get_tree().create_timer(3.0).timeout
			$Camera2D/Label.visible=false
			
	elif val2==1 and Input.is_action_just_pressed("ui_accept"):
		
		$AnimationPlayer2.play("chest_open")
		$chest.play()
		$Camera2D/Label.text="This chest was already opened"
		$Camera2D/Label.visible = true
		save()
		
	if checkopen3==0 :
		if val3 == 1 and Input.is_action_just_pressed("ui_accept") :
			$AnimationPlayer3.play("chest_open")
			$chest.play()
			val3 = 0
			checkopen3=1
			healing=healing+1
			save()
			$Camera2D/Label.text="You've discovered a HEALING POTION"
			$Camera2D/Label.visible=true
			await get_tree().create_timer(3.0).timeout
			$Camera2D/Label.visible=false
			
	elif val3==1 and Input.is_action_just_pressed("ui_accept"):
		
		$AnimationPlayer3.play("chest_open")
		$chest.play()
		$Camera2D/Label.text="This chest was already opened"
		$Camera2D/Label.visible = true
		save()
		


func _on_area_2d_body_exited(body):
	val = 0
	$Camera2D/Label.visible=false
	if position.y>950:
		val2=0



func save():
	var file = FileAccess.open(pathfile,FileAccess.WRITE)
	file.store_var(checkopen1)
	file.store_var(sword)
	file.store_var(positionsx)
	file.store_var(positionsy)
	file.store_var(armor)
	file.store_var(checkopen2)
	file.store_var(healing)
	file.store_var(checkopen3)

func load_data():
	if FileAccess.file_exists(pathfile):
		var file=FileAccess.open(pathfile,FileAccess.READ)
		checkopen1=file.get_var(checkopen1)
		sword=file.get_var(sword)
		position.x=file.get_var()
		position.y=file.get_var()
		armor=file.get_var()
		checkopen2=file.get_var()
		healing=file.get_var()
		checkopen3=file.get_var()
		
		
	else:
		print("ceva?")
	


func _on_boss_run_body_entered(body):
	if position.y<-1000:
		get_tree().change_scene_to_file("res://fight.tscn")
