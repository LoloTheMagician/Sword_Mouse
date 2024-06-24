extends CharacterBody2D

@export_range(10, 100, 10) var speed : int = 10

@onready var hitbox : Hitbox = %Hitbox


func _physics_process(_delta):
	var direction : Vector2 = (get_global_mouse_position() - global_position)
	velocity =  direction * speed
	move_and_slide()


func attack():
	$AnimationPlayer.play('Attack')
	

func _unhandled_input(event : InputEvent):
	if event and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		attack()
		

func _on_hitbox_area_entered(_area : Hurtbox):
	%Slash.play()
