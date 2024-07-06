extends Area2D

signal  on_collision

@export var speed := 500
var angular_speed := PI
@export var speed_factor := 1.5
@export var rotation_factor := speed_factor * 2
var swimming := false
@export var body_scale := 1.0

var hit_points = 0
@export var intelligence := 0
@export var strength := 0
@export var dexterity := 0
@export var constitution := 0

@onready var timer_list = $TimerList
@onready var sprite = $ODSeaSprite
@onready var collision_shape = $ODSeaCollisionShape
@onready var health = $Control/ODSeaHealth

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Movement Stuff
	if not swimming and Input.is_action_pressed("movement_up"):
		swimming = true
	
	var direction = 0
	if Input.is_action_pressed("movement_left"):
		direction = -1
	if Input.is_action_pressed("movement_right"):
		direction = 1

	rotation += ((angular_speed * direction * delta) * rotation_factor)

	var velocity = Vector2.ZERO
	# 
	if swimming:
		velocity = ((Vector2.UP.rotated(rotation) * speed) * speed_factor)

	position += velocity * delta
	
	if Input.is_action_pressed("movement_down"):
		swimming = false	
		
	# Actions
	if Input.is_action_just_pressed("action_bar"):
		print_debug("spaced")
		health.set_value_no_signal( health.value - 5)


# Called when the node enters the scene tree for the first time.
func _ready():
	health.max_value = (constitution * 2) + constitution
	health.min_value = 0
	health.fill_mode = 0
	health.value = health.max_value
	health.show()

func _on_body_entered(body):
	on_collision.emit()
	
