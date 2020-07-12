


timer++

x += lengthdir_x(grav_amount,global.grav_dir)
y += lengthdir_y(grav_amount,global.grav_dir)


if image_alpha < 1{
	image_alpha += .01
}

sway_base += sway_randomness + wind_force
x_offset = amplitude * sin(timer * frequency) + sway_base
amplitude = clamp(amplitude + .5, 0, amplitude_max)



