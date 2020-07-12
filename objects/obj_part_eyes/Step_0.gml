
//ysp += grav_speed
//y += ysp


xsp += lengthdir_x(grav_speed,global.grav_dir)
ysp += lengthdir_y(grav_speed,global.grav_dir)

y += ysp
x += xsp

//scr_collision()



/*if falling{
	xsp += lengthdir_x(.3,global.grav_dir)
	ysp += lengthdir_y(.3,global.grav_dir)
}else{
	if point_distance(0,0,xsp,ysp) > .5{
		xsp += lengthdir_x(-.3,global.grav_dir)
		ysp += lengthdir_y(-.3,global.grav_dir)
	}
}
y += ysp
x += xsp*/