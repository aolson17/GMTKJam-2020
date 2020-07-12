grav_speed = .2
falling = false

image_speed = .3
image_index = 1

rsp = choose(1,-1)

xsp = random_range(-2,2) + lengthdir_x(-3,global.grav_dir)
ysp = random_range(-2,2) + lengthdir_y(-3,global.grav_dir)
