
move_h = right_key-left_key
move_v = down_key-up_key

/*var move_dir = point_direction(0,0,xsp,ysp)
var move_mag = point_distance(0,0,xsp,ysp)

var move_max_x = lengthdir_x(move*move_spd_max,global.grav_dir+90)
var move_max_y = lengthdir_y(move*move_spd_max,global.grav_dir+90)

var move_max_dot_sp = xsp*move_max_x+ysp*move_max_y // curent momentum vector dot Max movespeed vector

var move_proj_x = (move_max_dot_sp/power(move_spd_max,2))*move_max_x // The vector result of the current momuntum vector projected onto the max movespeed vector

show_debug_message("move_max_x: "+string(move_max_x))
show_debug_message("move_max_y: "+string(move_max_y))
show_debug_message("move_max_dot_sp: "+string(move_max_dot_sp))
show_debug_message("move_proj_x: "+string(move_proj_x))

if abs(move_proj_x + move*move_spd) < move_spd_max{
	xsp += lengthdir_x(move*move_spd,global.grav_dir+90)
	ysp += lengthdir_y(move*move_spd,global.grav_dir+90)
	//xsp += move*move_spd
}else{
	var prev_xsp = xsp
	var prev_ysp = ysp
	
	xsp+=lengthdir_x(move*move_spd,global.grav_dir+90)
	ysp+=lengthdir_y(move*move_spd,global.grav_dir+90)
	
	var new_move_max_dot_sp = xsp*move_max_x+ysp*move_max_y
	var new_move_proj_x = (new_move_max_dot_sp/power(move_spd_max,2))*move_max_x
	
	if abs(new_move_proj_x) >= abs(move_proj_x){
		xsp = prev_xsp
		ysp = prev_ysp
	}
}*/



var adj_angle = abs(global.grav_dir)%180 // Angle is 0 to 180 instead of 0 to 360

var adj_angle_dif = abs(angle_difference(adj_angle,90))

var horizontal_power_factor = 1-(adj_angle_dif/90)
var vertical_power_factor = 1-horizontal_power_factor

/*show_debug_message(global.grav_dir)
show_debug_message(adj_angle)
show_debug_message(adj_angle_dif)
show_debug_message(horizontal_power_factor)*/

//show_debug_message((-90)%180)

if abs(xsp + move_h*move_spd*horizontal_power_factor) < move_spd_max*horizontal_power_factor{
	xsp += move_h*move_spd*horizontal_power_factor
}else{
	if abs(xsp + move_h*move_spd*horizontal_power_factor) < abs(xsp){
		xsp += move_h*move_spd*horizontal_power_factor
	}else{
		if abs(xsp) < move_spd_max*horizontal_power_factor{
			xsp = move_spd_max * sign(xsp) * horizontal_power_factor
		}
	}
}

if abs(ysp + move_v*move_spd*vertical_power_factor) < move_spd_max*vertical_power_factor{
	ysp += move_v*move_spd*vertical_power_factor
}else{
	if abs(ysp + move_v*move_spd*vertical_power_factor) < abs(ysp){
		ysp += move_v*move_spd*vertical_power_factor
	}else{
		if abs(ysp) < move_spd_max*vertical_power_factor{
			ysp = move_spd_max * sign(ysp) * vertical_power_factor
		}
	}
}


var move_dir = point_direction(0,0,xsp,ysp)
var move_mag = point_distance(0,0,xsp,ysp)

if on_ground{
	if move_h = 0 && move_v = 0{
		if move_mag-fric > 0{
			xsp = lengthdir_x(move_mag-fric,move_dir)
			ysp = lengthdir_y(move_mag-fric,move_dir)
			//xsp -= fric*sign(xsp)
		}else{
			xsp = 0
			ysp = 0
		}
	}
}else{
	//show_debug_message("apply grav")
	/*if move_mag < fall_spd_max{
		xsp+=lengthdir_x(fall_spd,global.grav_dir)
		ysp+=lengthdir_y(fall_spd,global.grav_dir)
	}else{
		var prev_xsp = xsp
		var prev_ysp = ysp
	
		xsp+=lengthdir_x(fall_spd_max,global.grav_dir)
		ysp+=lengthdir_y(fall_spd_max,global.grav_dir)
		show_debug_message("v xsp add: "+string(lengthdir_x(fall_spd_max,global.grav_dir)))
		show_debug_message("v ysp add: "+string(lengthdir_y(fall_spd_max,global.grav_dir)))
	
		var new_move_mag = point_distance(0,0,xsp,ysp)
		
		if new_move_mag >= move_mag{
			xsp = prev_xsp
			ysp = prev_ysp
		}
		
		
		/*xsp+=lengthdir_x(fall_spd,global.grav_dir)
		ysp+=lengthdir_y(fall_spd,global.grav_dir)
		
		var move_dir = point_direction(0,0,xsp,ysp)
		
		xsp = lengthdir_x(fall_spd_max,move_dir)
		ysp = lengthdir_y(fall_spd_max,move_dir)*/
	//}
		xsp+=lengthdir_x(fall_spd,global.grav_dir)
		ysp+=lengthdir_y(fall_spd,global.grav_dir)
}
	
scr_collision_player()
