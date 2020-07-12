
var collision = false

if place_meeting((x+xsp),(y),par_solid){
	var limit = abs(xsp)
	
	while(!place_meeting((x+sign(xsp)),(y),par_solid) && limit >= 0){
		x += sign(xsp)
		limit -= abs(xsp)
	}
	while(!place_meeting((x+sign(xsp)*.2),(y),par_solid) && limit >= 0 ){
		x += sign(xsp)*.2
		limit -= abs(sign(xsp))*.2
	}
	collision = true
	xsp = 0
	x = round(x)
}else{
	x += xsp
}

if place_meeting((x),(y+ysp),par_solid){
	var limit = abs(ysp+1)
	
	while(!place_meeting((x),(y+sign(ysp)),par_solid) && limit >= 0){
		y += sign(ysp)
		limit -= abs(sign(ysp))
	}
	while(!place_meeting((x),(y+sign(ysp)*.2),par_solid) && limit >= 0){
		y += sign(ysp)*.2
		limit -= abs(sign(ysp))*.2
	}
	collision = true
	y = round(y)
	ysp = 0
}else{
	y += ysp
}

if place_meeting(x,y,par_solid){
	show_debug_message("-!Move Out of Solid!-")
	x += lengthdir_x(1,global.grav_dir-180)
	y += lengthdir_y(1,global.grav_dir-180)
}


return collision

