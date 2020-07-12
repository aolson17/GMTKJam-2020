


if !audio_is_playing(global.battery_sound){
	global.battery_sound = audio_play_sound(snd_battery_get,0,0)
	audio_sound_gain(global.battery_sound,global.master_volume*global.sound_volume,0)
}

obj_player.batteries++

instance_destroy()




