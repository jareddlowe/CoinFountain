extends CharacterBody2D

var bounced_once = false


func _ready():
	# Start the first upward movement
	$CoinSpriteBody.velocity.y -= randf_range(80, 120)


func _process(delta):
	# Slow the whole coin over time
	velocity = velocity.lerp(Vector2.ZERO, 0.03)
	# Move the whole coin 
	move_and_slide()
	
	# Apply gravity to the coin sprite's body
	$CoinSpriteBody.velocity.y += 3
	# Move the coin sprite's body
	if $CoinSpriteBody.global_position.y > global_position.y: 
		$CoinSpriteBody.global_position.y = global_position.y # Prevents coin from going below shadow
		$CoinSpriteBody.velocity.y = 0
		if not bounced_once: # Triggers bounce if not already bounced
			$CoinSpriteBody.velocity.y -= randf_range(60, 80)
			bounced_once = true
	$CoinSpriteBody.move_and_slide()
