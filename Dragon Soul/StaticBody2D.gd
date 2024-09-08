extends StaticBody2D

const projectile_scene = preload("res://projectile.tscn")
const speed = 100
func _ready():
	set_process(true)
const projectile_scene2= preload("res://projectile2.tscn")
const projectile_scene3= preload("res://projectile3.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
const BOX_WIDTH =390
const BOX_HEIGHT = 480

func send_projectiles():
	var counter=0
	for i in range(20):
		counter=counter+1
		var start_pos = Vector2(183, randf_range(460,320))
		send_projectile(start_pos,BOX_WIDTH)
		await get_tree().create_timer(0.4).timeout
		if counter == 20:
			await get_tree().create_timer(3).timeout
		
func attack2():
	for i in range(3):
		send_attack()
		await get_tree().create_timer(3).timeout
		
func send_projectile(start_pos, end_pos):
	var projectile= projectile_scene.instantiate()
	projectile.z_index=3
	projectile.position=start_pos
	get_parent().add_child(projectile)
	$ball.play()
	await get_tree().create_timer(3).timeout
	

func send_attack():
	var projectile2=0
	var a =randf_range(0,2)
	if a>1:
		projectile2=projectile_scene2.instantiate()
	else:
		projectile2=projectile_scene3.instantiate()
	projectile2.z_index=3
	projectile2.position=Vector2(183,300)
	get_parent().add_child(projectile2)
	$move.play()
	await get_tree().create_timer(3).timeout
	
	


