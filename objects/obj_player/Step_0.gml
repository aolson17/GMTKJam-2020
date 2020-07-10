

grapple_distance = point_distance(x,y,obj_grapple.x,obj_grapple.y)

on_ground = place_meeting(x,y+1,par_solid)

if state = states.fall{
	
	if shoot_key{
		state = states.shoot
		
		aim_dir = point_direction(x,y,mouse_x,mouse_y)
		
		obj_grapple.x = x+lengthdir_x(grapple_length_min,aim_dir)
		obj_grapple.y = y+lengthdir_y(grapple_length_min,aim_dir)
		
		
		obj_grapple.xsp = lengthdir_x(grapple_speed,aim_dir)+xsp
		obj_grapple.ysp = lengthdir_y(grapple_speed,aim_dir)+ysp
		
	}
	
	if grapple_length > grapple_length_min{
		grapple_length *= .95
	}else{
		grapple_length = grapple_length_min
	}
	
	if grapple_distance > grapple_length{
		var dir = point_direction(x,y,obj_grapple.x,obj_grapple.y)
		
		obj_grapple.x = x+lengthdir_x(grapple_length,dir)
		obj_grapple.y = y+lengthdir_y(grapple_length,dir)
	}
	
	scr_move()
	
}else if state = states.shoot{
	
	
	if distance_to_object(obj_grapple) > grapple_length_max{
		grapple_length = grapple_length_max
		obj_grapple.xsp = xsp
		obj_grapple.ysp = ysp
		state = states.fall
	}
	
	
	if ysp < fall_spd_max{
	ysp+=fall_spd
	}
	
	scr_collision()
	
}else if state = states.swing{
	
	move = right_key-left_key
	
	asp += move*.05
	
	if up_key{
		grapple_length--
		asp *= 1.01
	}
	if grapple_length < grapple_length_min{
		grapple_length = grapple_length_min
		asp *= .8
	}
	
	if down_key{
		grapple_length++
		asp *= .97
	}
	if grapple_length > grapple_length_max{
		grapple_length = grapple_length_max
	}
	
	if !on_ground{
		if angle_difference(grapple_dir,-90) > 90{
			// Gravity makes slack
			show_debug_message("not grav")
			state = states.slack
			
			var spd = asp * (2*pi*grapple_length)/360
			xsp = lengthdir_x(spd,grapple_dir+(90))
			ysp = lengthdir_y(spd,grapple_dir+(90))+fall_spd
		}else{
			show_debug_message("grav")
			asp += -angle_difference(point_direction(obj_grapple.x,obj_grapple.y,x,y),point_direction(obj_grapple.x,obj_grapple.y,x,y+fall_spd))
		}
	}else{
		state = states.slack
	}
	
	if grapple_distance > grapple_length{
		var dir = point_direction(obj_grapple.x,obj_grapple.y,x,y)
		
		x = obj_grapple.x+lengthdir_x(grapple_length,dir)
		y = obj_grapple.y+lengthdir_y(grapple_length,dir)
	}
	
	if release_key{
		state = states.fall
		
		var spd = asp * (2*pi*grapple_length)/360
		
		xsp = lengthdir_x(spd,grapple_dir+(90))
		ysp = lengthdir_y(spd,grapple_dir+(90))
	}
	
	grapple_dir += asp
	
	var prev_x = x
	var prev_y = y
	x = obj_grapple.x+lengthdir_x(grapple_length,grapple_dir)
	y = obj_grapple.y+lengthdir_y(grapple_length,grapple_dir)
	if place_meeting(x,y,par_solid){
		x = prev_x
		y = prev_y
		asp = -asp*.1
	}
	
}else if state = states.slack{
	
	scr_move()
	
	if grapple_distance > grapple_length{
		var dir = point_direction(obj_grapple.x,obj_grapple.y,x,y)
		
		x = obj_grapple.x+lengthdir_x(grapple_length,dir)
		y = obj_grapple.y+lengthdir_y(grapple_length,dir)
		state = states.swing
		grapple_dir = point_direction(obj_grapple.x,obj_grapple.y,x,y)
		asp = -angle_difference(point_direction(obj_grapple.x,obj_grapple.y,x,y),point_direction(obj_grapple.x,obj_grapple.y,x+xsp,y+ysp))
	}
	
	if angle_difference(grapple_dir,-90) > 90{
		}
	
	if release_key{
		state = states.fall
	}
}




