extends RigidBody2D

export var target = Vector2(0,0)
export var missile_speed = 1
var isNuke = false;

var missile_exploding = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.set_animation("missile")
	

func _process(delta):
	if(!missile_exploding):
		var threshold = 5
		var direction = (position - target)
		var dist = direction.length()
		direction = direction.normalized()
		position -= direction* missile_speed * delta
		
		if dist < threshold:
			$CollisionShape2D.disabled = false
			missile_exploding = true
			$AnimationPlayer.play("scale")
			$AnimatedSprite.set_animation("explosion")


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()


func _on_AntiNuke_body_entered(body):
	if(missile_exploding and body.isNuke):
		body.queue_free()

