# looking for the perfect gravity value, i found a problem... and the solution too.

This code is writed for try to understand the kinematicbody2d  and the move_and_slide

a lot of tutorial around the internet put a "random value" in gravity for simulate the physics in godot games.  but what happen if you want to control  de time  of the object falling a controlate distance (like N time her body size.)

gravity is a aceleration value.  so the normal solution could be this

    var GRAVITY = 32 * 6
    var velocity = Vector2()
    #
    func _physics_process(delta):
        velocity.y += GRAVITY * delta 
        self.move_and_slide(velocity, Vector2(0, -1))
 
So if the object have a height of 32px the GRAVITY value is 32 * 6 = 192... in theory the object arrive to the floor in 1 second.
but this don't happen, the object arrive in 1.3 seconds.

the problem is the move_and_slide,  this method do a extra delta multiplication.
if we want to arrive to the floor in half second the theory says that we can use 32 * 6 * 2 = 384  but aggain the double delta multiplications affect the theory and the object arrive in 0.7 seconds.

if we want to arrive to the floor in 5 seconds the theory says that we can use 32 * 6 * 0.2 = 38.4 but aggain the double delta multiplications affect the theory and the object arrive in 3 seconds.

this coused me a headache for a few hours... but after many experiments i found a soulution.


    var DISTANCE_TIME = 1
    # var DISTANCE_TIME = 2 # six times the player in half second
    # var DISTANCE_TIME = 0.2 # six times the player in  5 seconds
    var GRAVITY = 32 * 6 * DISTANCE_TIME # six times 
    var velocity = Vector2()
    #
    func _physics_process(delta):
        # print(velocity)
        velocity.y += GRAVITY * delta * 2 * DISTANCE_TIME
        self.move_and_slide(velocity, Vector2(0, -1))
        
 when i do this operation GRAVITY * delta  * 2 * DISTANCE_TIME the time and acceleration works as expected.
  
  
but i dont understanding why....
