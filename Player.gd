extends KinematicBody2D
var DISTANCE_TIME = 1
# var DISTANCE_TIME = 2 # half second
# var DISTANCE_TIME = 0.2 #  5 seconds
var GRAVITY = 32 * 6 * DISTANCE_TIME # (six times the player height) * DISTANCE_TIME
var JUMP_SPEED = (32 * 6) * 2 * DISTANCE_TIME
var velocity = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func _input(event):
    if Input.is_action_pressed("jump"):
        print('jump')
        velocity.y = -JUMP_SPEED

var floor_flag = false #just a flat for print one time
func _physics_process(delta):
    # print(velocity)
    velocity.y += GRAVITY * delta * 2 * DISTANCE_TIME
    self.move_and_slide(velocity, Vector2(0, -1))
    if self.is_on_floor() and not floor_flag:
        floor_flag = true
        print(true)

var timer = 0
func _on_Timer_timeout():
    timer+=1
    if not self.is_on_floor():
        print(timer)
