extends CharacterBody2D

const SPEED : float = 1.7
const MAX_SPEED : int = 95;
const ACCELERATION : int = 500;
const FRICTION : int = 500;


#func _ready() -> void:
	#print("Hello World");

func _physics_process(delta: float) -> void:
	motion_mode =1;
	var _input_vector = Vector2.ZERO
	_input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	_input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	_input_vector = _input_vector.normalized();
	if _input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(_input_vector * MAX_SPEED, ACCELERATION * delta)
		#velocity += _input_vector * ACCELERATION  * delta ;
		#velocity = velocity.limit_length(MAX_SPEED);
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	print(velocity);
	move_and_slide();
	

func _normalizeVector(movement : Vector2) -> Vector2:
	var norm := movement;
	var x = norm.x
	var y = norm.y
	var mag = sqrt(x*x + y*y)
	if mag == 0:
		x = Vector2.ZERO
		y = Vector2.ZERO
		return norm
	norm.x = (x /mag)
	norm.y = (y/mag)
	return norm	
		
