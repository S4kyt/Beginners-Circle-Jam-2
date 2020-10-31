extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()
var playerMovingRight = false;
var playerMovingLeft = false;

func get_input():
	
	velocity = Vector2()
	
	if Input.is_action_pressed('Movement Right'):
		$AnimatedSprite.play("Player-Moving-Right")
		playerMovingRight = true
		velocity.x += 1
	elif Input.is_action_just_released("Movement Right"):
		$AnimatedSprite.play("Player-Idle-Right")
		
	if Input.is_action_pressed('Movement Left'):
		$AnimatedSprite.play("Player-Moving-Left")
		playerMovingLeft = true
		velocity.x -= 1
	elif Input.is_action_just_released('Movement Left'):
		$AnimatedSprite.play("Player-Idle-Left")
		
	if Input.is_action_pressed('Movement Down'):
		velocity.y += 1
		#Animation needed first!
		
	if Input.is_action_pressed('Movement Up'):
		velocity.y -= 1
		#Animation needed first!
		
	velocity = velocity.normalized() * speed
	
	

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
