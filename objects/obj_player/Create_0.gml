

enum states{
	fall,
	shoot,
	swing,
	slack
}

move_spd = .5
move_spd_max = 2.5

fric = .5

xsp = 0
ysp = 0

asp = 0 // Angular velocity
grapple_dir = 0

state = states.fall

aim_dir = 0

facing = 1

fall_spd_max = 5
fall_spd = .1

grapple_speed = 10
grapple_length_max = 180
grapple_length_min = 15
grapple_length = 0
