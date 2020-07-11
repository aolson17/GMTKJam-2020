

grapple_distance = point_distance(x,y,obj_grapple.x,obj_grapple.y)

on_ground = place_meeting(x+lengthdir_x(1,global.grav_dir),y+lengthdir_y(1,global.grav_dir),par_solid)

if state = states.fall{
	
	if shoot_key_down{
		aim_dir = point_direction(x,y,mouse_x,mouse_y)
		obj_grapple.x = x+lengthdir_x(grapple_length_min,aim_dir)
		obj_grapple.y = y+lengthdir_y(grapple_length_min,aim_dir)
		obj_grapple.image_angle = aim_dir
	}
	if shoot_key_released{
		if grapple_length < .3*grapple_length_max{
			state = states.shoot
		
			aim_dir = point_direction(x,y,mouse_x,mouse_y)
		
			obj_grapple.x = x+lengthdir_x(grapple_length_min,aim_dir)
			obj_grapple.y = y+lengthdir_y(grapple_length_min,aim_dir)
		
			obj_grapple.xsp = lengthdir_x(grapple_speed,aim_dir)+xsp*.6
			obj_grapple.ysp = lengthdir_y(grapple_speed,aim_dir)+ysp*.6
		}
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
	
	scr_move()
	
}else if state = states.swing{
	
	move_h = right_key-left_key
	move_v = down_key-up_key
	
	var adj_angle = abs(global.grav_dir)%180 // Angle is 0 to 180 instead of 0 to 360
	
	var adj_angle_dif = abs(angle_difference(adj_angle,90))
	
	var horizontal_power_factor = 1-(adj_angle_dif/90)
	var vertical_power_factor = 1-horizontal_power_factor
	
	if abs(angle_difference(global.grav_dir,270)) <= 45{
		asp += move_h*.05
		show_debug_message("1 "+string(global.grav_dir))
	}else if abs(angle_difference(global.grav_dir,180)) <= 45{
		asp += move_v*.05
		show_debug_message("2 "+string(global.grav_dir))
	}else if abs(angle_difference(global.grav_dir,90)) <= 45{
		asp -= move_h*.05
		show_debug_message("3 "+string(global.grav_dir))
	}else if abs(angle_difference(global.grav_dir,0)) <= 45{
		asp -= move_v*.05
		show_debug_message("4 "+string(global.grav_dir))
	}
	
	
	if retract_key{
		grapple_length--//*=.9//
		asp *= 1.02
	}
	if grapple_length < grapple_length_min{
		grapple_length = grapple_length_min
		asp *= .8
	}
	
	if extend_key{
		grapple_length++//*=1.1
		asp *= .97
	}
	if grapple_length > grapple_length_max{
		grapple_length = grapple_length_max
	}
	
	if !on_ground{
		if abs(angle_difference(grapple_dir,global.grav_dir)) > 90{
			// Gravity makes slack
			//show_debug_message("not grav")
			state = states.slack
			
			var spd = asp * (2*pi*grapple_length)/360
			xsp = lengthdir_x(spd,grapple_dir+(90))+lengthdir_x(fall_spd*2,global.grav_dir)
			ysp = lengthdir_y(spd,grapple_dir+(90))+lengthdir_y(fall_spd*2,global.grav_dir)
		}else{
			//show_debug_message("grav")
			asp += -angle_difference(point_direction(obj_grapple.x,obj_grapple.y,x,y),point_direction(obj_grapple.x,obj_grapple.y,x+lengthdir_x(fall_spd,global.grav_dir),y+lengthdir_y(fall_spd,global.grav_dir)))
		}
	}else{
		state = states.slack
	}
	
	if grapple_distance > grapple_length{
		var dir = point_direction(obj_grapple.x,obj_grapple.y,x,y)
		
		var prev_x = x
		var prev_y = y
		
		x = obj_grapple.x+lengthdir_x(grapple_length,dir)
		y = obj_grapple.y+lengthdir_y(grapple_length,dir)
		
		
		if place_meeting(x,y,par_solid){
			x = prev_x
			y = prev_y
			grapple_length = point_distance(x,y,obj_grapple.x,obj_grapple.y)+1
			if grapple_length > grapple_length_max{
				grapple_length = grapple_length_max
			}
		}
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
		show_debug_message("-!Grappled and in wall!- "+string(random(10)))
		grapple_dir -= asp/2
		asp = -asp*.8
	}
	
}else if state = states.slack{
	
	if retract_key{
		grapple_length--//*=.9//
	}
	if grapple_length < grapple_length_min{
		grapple_length = grapple_length_min
	}
	
	if extend_key{
		grapple_length++//*=1.1//
	}
	if grapple_length > grapple_length_max{
		grapple_length = grapple_length_max
	}
	
	
	scr_move()
	
	
	if grapple_distance > grapple_length{
		var dir = point_direction(obj_grapple.x,obj_grapple.y,x,y)
		var prev_x = x
		var prev_y = y
		
		x = obj_grapple.x+lengthdir_x(grapple_length,dir)
		y = obj_grapple.y+lengthdir_y(grapple_length,dir)
		state = states.swing
		grapple_dir = point_direction(obj_grapple.x,obj_grapple.y,x,y)
		asp = -angle_difference(point_direction(obj_grapple.x,obj_grapple.y,x,y),point_direction(obj_grapple.x,obj_grapple.y,x+xsp,y+ysp))
		
		
		
		
		if place_meeting(x,y,par_solid){
			x = prev_x
			y = prev_y
			//grapple_length = point_distance(x,y,obj_grapple.x,obj_grapple.y)
			//if grapple_length > grapple_length_max{
			//	grapple_length = grapple_length_max
			//}
		}
	}
	
	if release_key{
		state = states.fall
	}
}




