extends CharacterBody2D

# ความเร็วและการตั้งค่า
const SPEED = 300.0
const GRAVITY = 980.0

func _physics_process(delta):

	# 1. แรงโน้มถ่วง
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# 2. รับค่า Input
	var direction = Input.get_axis("ui_left", "ui_right")

	# 3. การเคลื่อนที่
	if direction:
		velocity.x = direction * SPEED
		
		# เล่นอนิเมชันเดิน
		$AnimatedSprite2D.play("idle")

		# หันซ้ายขวา
		if direction > 0:
			$AnimatedSprite2D.flip_h = false
		elif direction < 0:
			$AnimatedSprite2D.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
		# หยุดเดิน (เฟรมแรกของ idle)
		$AnimatedSprite2D.stop()

	# 4. ขยับตัวละคร
	move_and_slide()
