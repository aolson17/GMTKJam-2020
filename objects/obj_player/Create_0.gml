

enum states{
	fall,
	shoot,
	swing,
	slack,
	dead
}

dead = false

move_spd = .5
move_spd_max = 2.5

grapple_length_speed = 1.5

fric = .5

xsp = 0
ysp = 0

asp = 0 // Angular velocity
grapple_dir = 0

state = states.fall

hp = 3

tail_sound = noone
collision_sound = noone

aim_dir = 0

face_angle = point_direction(0,0,xsp,ysp)

facing = 1

batteries = 0


hurt_frames = 40
hurt = 0

fall_spd_max = 5
fall_spd = .1

grapple_speed = 10
grapple_length_max = 200
grapple_length_min = 15
grapple_length = 0
