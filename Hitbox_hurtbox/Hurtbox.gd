extends Area2D



const HitEffect = preload("res://Efectos/EfectoGolpe.tscn")

#Invencible
var invincible = false setget set_invincible

signal invincibility_started
signal invincibility_ended

onready var timer = $Timer

func set_invincible(value):
	invincible = value
	if invincible==true:
		emit_signal("invincibility_started")
	else:
		emit_signal("invincibility_ended")
	

#Comienzo invencibilidad
func start_invincibility(duration):
	self.invincible = true
	timer.start(duration)
	


#Conexion Node
func create_hit_effect():
	var effect = HitEffect.instance()
	var main = get_tree().current_scene
	main.add_child(effect)
	effect.global_position = global_position


func _on_Timer_timeout():
	self.invincible = false


func _on_Hurtbox_invincibility_started():
	set_deferred("monitorable",false)
	monitorable = false


func _on_Hurtbox_invincibility_ended():
	monitorable = true

