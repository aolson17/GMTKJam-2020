


if can_damage{
	if image_alpha < 1{
		image_alpha += .05
	}
}else{
	if image_alpha > 1{
		image_alpha -= .08
	}else{
		instance_destroy()
	}
}

if distance_to_object(obj_player) < 2{
	if can_damage{
		can_damage = false
		obj_player.state = states.fall
		obj_player.hp--
		obj_player.hurt = obj_player.hurt_frames
		obj_player.xsp = sign(obj_player.x-x)*1.5
		obj_player.ysp = sign(obj_player.y-y)*1.5
		if !audio_is_playing(global.damage_sound){
			global.damage_sound = audio_play_sound(snd_taking_damage,0,0)
			audio_sound_gain(global.damage_sound,global.master_volume*global.sound_volume,0)
		}
	}
}

if place_meeting(x,y,obj_terrain){
	instance_create_layer(x,y,layer,obj_flash_2)
	instance_destroy()
}

x += xsp
y += ysp
