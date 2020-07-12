

grapple_distance = point_distance(x,y,obj_grapple.x,obj_grapple.y)

on_ground = place_meeting(x+lengthdir_x(1,global.grav_dir),y+lengthdir_y(1,global.grav_dir),par_solid)

if state = states.fall{
	
	if shoot_key_pressed{
		if !audio_is_playing(tail_sound){
			tail_sound = audio_play_sound(snd_tail_charge,0,0)
			audio_sound_gain(tail_sound,global.master_volume*global.sound_volume,0)
		}
	}
	if shoot_key_down{
		aim_dir = point_direction(x,y,mouse_x,mouse_y)
		obj_grapple.x = x+lengthdir_x(grapple_length_min,aim_dir)
		obj_grapple.y = y+lengthdir_y(grapple_length_min,aim_dir)
		obj_grapple.image_angle = aim_dir
	}
	if shoot_key_released{
		if grapple_length < .3*grapple_length_max{
			state = states.shoot
			
			scr_play_sound(snd_tail_shot)
		
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
	
	if abs(angle_difference(global.grav_dir,270)) <= 90{
		asp += move_h*.05
	}else{
		asp -= move_h*.05
	}
	if abs(angle_difference(global.grav_dir,0)) <= 90{
		asp -= move_v*.05
	}else{
		asp += move_v*.05
	}
	
	
	if retract_key{
		if !audio_is_playing(tail_sound){
			tail_sound = audio_play_sound(snd_tail_retract,0,0)
			audio_sound_gain(tail_sound,global.master_volume*global.sound_volume,0)
		}
		grapple_length-=grapple_length_speed//*=.9//
		asp *= 1.02
	}
	if grapple_length < grapple_length_min{
		grapple_length = grapple_length_min
		asp *= .8
	}
	
	if extend_key && !retract_key{
		if !audio_is_playing(tail_sound){
			tail_sound = audio_play_sound(snd_tail_extend,0,0)
			audio_sound_gain(tail_sound,global.master_volume*global.sound_volume,0)
		}
		grapple_length+=grapple_length_speed//*=1.1
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
			if !audio_is_playing(collision_sound){
				collision_sound = audio_play_sound(snd_collision,0,0)
				audio_sound_gain(collision_sound,global.master_volume*global.sound_volume,0)
			}
			grapple_length = point_distance(x,y,obj_grapple.x,obj_grapple.y)+1
			if grapple_length > grapple_length_max{
				grapple_length = grapple_length_max
			}
		}
	}
	
	if shoot_key_released{
		if audio_exists(tail_sound){
			audio_stop_sound(tail_sound)
		}
		scr_play_sound(snd_tail_detach)
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
		if !audio_is_playing(collision_sound){
			collision_sound = audio_play_sound(snd_collision,0,0)
			audio_sound_gain(collision_sound,global.master_volume*global.sound_volume,0)
		}
	}
	
}else if state = states.slack{
	
	if retract_key{
		if !audio_is_playing(tail_sound){
			tail_sound = audio_play_sound(snd_tail_retract,0,0)
			audio_sound_gain(tail_sound,global.master_volume*global.sound_volume,0)
		}
		grapple_length-=grapple_length_speed//*=.9//
	}
	if grapple_length < grapple_length_min{
		grapple_length = grapple_length_min
	}
	
	if extend_key && !retract_key{
		if !audio_is_playing(tail_sound){
			tail_sound = audio_play_sound(snd_tail_extend,0,0)
			audio_sound_gain(tail_sound,global.master_volume*global.sound_volume,0)
		}
		grapple_length+=grapple_length_speed//*=1.1//
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
	
	if shoot_key_released{
		if audio_exists(tail_sound){
			audio_stop_sound(tail_sound)
		}
		scr_play_sound(snd_tail_detach)
		state = states.fall
	}
}else if state = states.dead{
	obj_music.music_to_play = "none"
	xsp = 0
	ysp = 0
	
	if dead = false{
		dead = true
		
		var sound = audio_play_sound(snd_death_jingle_2,0,0)
		audio_sound_gain(sound,global.master_volume*global.sound_volume*.8,0)
		
		instance_create_layer(x,y,"Instances",obj_flash)
		instance_create_layer(x,y,"Instances",obj_part_1)
		instance_create_layer(x,y,"Instances",obj_part_2)
		instance_create_layer(x,y,"Instances",obj_part_3)
		instance_create_layer(x,y,"Instances",obj_part_4)
		instance_create_layer(x,y,"Instances",obj_part_5)
		instance_create_layer(x,y,"Instances",obj_part_6)
		instance_create_layer(x,y,"Instances",obj_part_7)
		instance_create_layer(x,y,"Instances",obj_part_8)
		eyes = instance_create_layer(x,y,"Cursor",obj_part_eyes)
		eyes.image_xscale = facing
		instance_create_layer(x,y,"Instances",obj_part_5)
		
		alarm[0] = 170
	}
	
}


if hp <= 0{
	state = states.dead
	dead_x = x
	dead_y = y
}

