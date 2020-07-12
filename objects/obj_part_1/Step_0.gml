
if !place_meeting(x+lengthdir_x(1,global.grav_dir),y+lengthdir_y(1,global.grav_dir),par_solid){ // Apply gravity
	if !place_meeting(x,y+1,obj_player){
		xsp += lengthdir_x(grav_speed,global.grav_dir)
		ysp += lengthdir_y(grav_speed,global.grav_dir)
	}
	image_angle += rsp
	falling = true
}else{ // Apply Friction
	if falling { // If previously falling
		//var sound = audio_play_sound(snd_box_fall,0,0)
		//audio_sound_gain(sound,global.master_volume*global.sound_volume,0)
	}
	falling = false
	xsp *= .9
	ysp *= .9
}
//y = round(y)
scr_collision()
