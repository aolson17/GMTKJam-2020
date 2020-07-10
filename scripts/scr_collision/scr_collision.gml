
if place_meeting((x+xsp),(y),par_solid){
	var limit = abs(xsp)
	
	while(!place_meeting((x+sign(xsp)),(y),par_solid) && limit >= 0){
		x += sign(xsp)
		limit -= abs(xsp)
	}
	
	xsp = 0
	//x = round(x)
}else{
	x += xsp
}

if place_meeting((x),(y+ysp),par_solid){
	var limit = abs(ysp)
	
	while(!place_meeting((x),(y+sign(ysp)),par_solid) && limit >= 0){
		y += sign(ysp)
		limit -= abs(sign(ysp))
	}
	
	y = round(y)
	ysp = 0
}else{
	y += ysp
}

if place_meeting(x,y,par_solid){
	y--
}




