

if can_damage{
	if distance_to_object(obj_player) <= 5{
		alarm[0] = damage_cooldown
		can_damage = false
		obj_player.hp--
		obj_player.hurt = obj_player.hurt_frames
		obj_player.xsp = sign(obj_player.x-x)*4
		obj_player.ysp = sign(obj_player.y-y)*4
		if !audio_is_playing(global.damage_sound){
			global.damage_sound = audio_play_sound(snd_taking_damage,0,0)
			audio_sound_gain(global.damage_sound,global.master_volume*global.sound_volume,0)
		}
	}
	
	
	
	
	
}
