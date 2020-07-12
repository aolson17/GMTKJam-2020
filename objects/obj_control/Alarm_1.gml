/// @description Change Gravity

if room != rm_menu{
	if obj_player.state != states.dead{

		scr_play_sound(snd_gravity_change)

		prev_grav = global.grav_dir

		while global.grav_dir = prev_grav{
			global.grav_dir = choose(0,90,180,270)//round(irandom_range(0,359)/10)*10
		}

		alarm[1] = irandom_range(gravity_change_time_min,gravity_change_time_max)


	}
}else{
	var s = scr_play_sound(snd_gravity_change)
	audio_sound_gain(s,global.master_volume*global.sound_volume*.3,0)

	prev_grav = global.grav_dir

	while global.grav_dir = prev_grav{
		global.grav_dir = choose(0,90,180,270)//round(irandom_range(0,359)/10)*10
	}

	alarm[1] = irandom_range(gravity_change_time_min,gravity_change_time_min+25*60)

}
