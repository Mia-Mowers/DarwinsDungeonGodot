extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var zoomSpeed = 10
export var rotationSpeed = 10
export var rotationSpeedKey = 100
export var minZoomDistance = 1
export var maxZoomDistance = 100

export var movementSpeed = 10

var lastMousePos = null
var movementVector = Vector3(0, 0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("middle_mouse") and lastMousePos != null:
		var mousePosDif = lastMousePos - get_viewport().get_mouse_position()
		if (get_rotation_degrees().x < 0 and mousePosDif.y > 0) or (get_rotation_degrees().x > -80 and mousePosDif.y < 0):
			set_rotation_degrees(get_rotation_degrees() + Vector3(1, 0, 0) * mousePosDif.y  * rotationSpeed * delta)
		set_rotation_degrees(get_rotation_degrees() + Vector3(0, 1, 0) * mousePosDif.x  * rotationSpeed * delta)
		
	lastMousePos = get_viewport().get_mouse_position()
	
	if Input.is_action_pressed("rotate_left_key"):
		set_rotation_degrees(get_rotation_degrees() + Vector3(0, 1, 0) * rotationSpeedKey * delta)
	if Input.is_action_pressed("rotate_right_key"):
		set_rotation_degrees(get_rotation_degrees() + Vector3(0, -1, 0) * rotationSpeedKey * delta)
	
	movementVector = Vector3(0, 0, 0)
	
	if Input.is_action_pressed("foward"):
		movementVector = movementVector + Vector3.FORWARD
	if Input.is_action_pressed("backward"):
		movementVector = movementVector + Vector3.BACK
	if Input.is_action_pressed("left"):
		movementVector = movementVector + Vector3.LEFT
	if Input.is_action_pressed("right"):
		movementVector = movementVector + Vector3.RIGHT
	
	movementVector = movementVector.rotated(Vector3.UP, get_rotation_degrees().y * 0.017460317)
	
	translation += movementVector.normalized() * movementSpeed * delta
