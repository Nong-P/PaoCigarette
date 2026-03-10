extends CharacterBody2D

# ความเร็วและการตั้งค่า
const SPEED = 300.0
const GRAVITY = 980.0

func _physics_process(delta):
	# 1. แรงโน้มถ่วง (ถ้าไม่อยู่บนพื้นให้ร่วงลงมา)
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# 2. รับค่า Input จากคีย์บอร์ด (ปุ่มลูกศร หรือ A-D)
	var direction = Input.get_axis("ui_left", "ui_right")
	
	# 3. จัดการการเคลื่อนที่และการหันหน้า
	if direction:
		velocity.x = direction * SPEED
		
		# เช็คทิศทางเพื่อกลับด้านรูปภาพ
		if direction > 0:
			$AnimatedSprite2D.flip_h = false # หันขวา
		elif direction < 0:
			$AnimatedSprite2D.flip_h = true  # หันซ้าย
	else:
		# ถ้าไม่กดปุ่ม ให้ค่อยๆ หยุดเดิน
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# 4. สั่งให้ Godot ขยับตัวละคร
	move_and_slide()
