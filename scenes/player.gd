extends Area2D


const SPEED = 75.0

func _process(delta):
	var flipped = $AnimatedSprite2D.flip_h
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("Move_Left"):
		velocity.x -= 1
		if !flipped:
			$AnimatedSprite2D.flip_h = true
	elif Input.is_action_pressed("Move_Right"):
		velocity.x += 1
		if flipped:
			$AnimatedSprite2D.flip_h = false
	
	if Input.is_action_pressed("Move_Up"):
		velocity.y -= 1
	elif Input.is_action_pressed("Move_Down"):
		velocity.y += 1
		
	velocity = velocity.normalized() * SPEED
	position += velocity * delta
	
	$AnimatedSprite2D.play()
	#position = position.clamp(Vector2.ZERO, screen_size)

	
	
