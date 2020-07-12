


wind_force = 0

timer = irandom_range(0,180)

grav_amount = random_range(.5,1.2)
angle_rotation = choose(-1,-2,2,3)


image_alpha = .1


sway_randomness = random_range(-1,1)
sway_base = sway_randomness

frequency = random_range(.04,.07)
amplitude = random_range(3,5)
amplitude_max = random_range(30,50)


x_offset = amplitude * sin(timer * frequency) + sway_base






