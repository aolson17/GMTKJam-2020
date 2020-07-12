



if point_in_rectangle(mouse_x,mouse_y,bbox_left,bbox_top,bbox_right,bbox_bottom){
	if mouse_check_button_pressed(mb_left){
		var sound = audio_play_sound(snd_menu,0,0)
		audio_sound_gain(sound,global.master_volume*global.sound_volume,0)
	}
	if mouse_check_button(mb_left){
		image_index = 2
		y_offset = 1
	}else{
		image_index = 1
		y_offset = 0
	}
	
	if mouse_check_button_released(mb_left){
		global.levels_unlocked = 0
		ini_open("data.ini")
		ini_write_real("Data","level_1_time",9999)
		ini_write_real("Data","level_2_time",9999)
		ini_write_real("Data","level_3_time",9999)
		ini_write_real("Data","level_4_time",9999)
		ini_write_real("Data","level_5_time",9999)
		ini_write_real("Data","level_6_score",0)
		ini_close()
	}
}else{
	image_index = 0
	y_offset = 0
}


