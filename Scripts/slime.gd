class_name Slime
extends CharacterBody2D

var base_scale := scale
var push_back : Vector2 = Vector2.ZERO
var push_back_force : int = 100
var mobs_singleton := Mobs
@onready var health_component : Health_Component = %Health_Component


func _ready():
	mobs_singleton.add_mobs.call(1)


func _physics_process(delta: float) -> void:
	velocity = lerp(push_back, Vector2.ZERO, delta * 10)
	move_and_slide()
	

func take_damage(damage : int):
	health_component.substract_life(damage)


func knock_back(source_position : Vector2):
	push_back = -global_position.direction_to(source_position) * push_back_force
	

func _on_timer_tween_timeout():
	var tween := create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN)
	tween.tween_property(self, 'scale', Vector2(2.25, 2.25), 0.25)
	tween.tween_property(self, 'scale', base_scale, 0.25)


func _on_hurtbox_area_entered(hitbox : Hitbox):
	if hitbox == null:
		return
	take_damage(hitbox.damage)
	knock_back(hitbox.global_position)
	
