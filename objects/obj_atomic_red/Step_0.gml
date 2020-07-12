

if state = atomic_states.normal{
	eye_sprite = spr_atomic_red_eyes
	if distance_to_object(obj_player) < anger_range{
		state = atomic_states.angry
		alarm[0] = angry_frames
		
	}
}else if state = atomic_states.angry{
	eye_sprite = spr_atomic_red_eyes_attack
	
}else if state = atomic_states.attack{
	eye_sprite = spr_atomic_red_eyes_attack
	if distance_to_object(obj_player) < attack_range{
		if can_damage{
			can_damage = false
			alarm[2] = damage_cooldown
			obj_player.hp--
			obj_player.hurt = obj_player.hurt_frames
			obj_player.xsp = sign(obj_player.x-x)*3
			obj_player.ysp = sign(obj_player.y-y)*3
			if !audio_is_playing(global.damage_sound){
				global.damage_sound = audio_play_sound(snd_taking_damage,0,0)
				audio_sound_gain(global.damage_sound,global.master_volume*global.sound_volume,0)
			}
		}
	}
	if distance_to_object(obj_player) > anger_range+50{
		state = atomic_states.normal
	}
}


rsp = clamp(rsp+random_range(-.02,.02),-1,1)


image_angle += rsp


if scr_collision(){
	xsp = choose(-.1,-.2,.1,.2)
	ysp = choose(-.1,-.2,.1,.2)
}

if distance_to_object(obj_grapple) < 3{
	if state = atomic_states.attack{
		if obj_player.state != states.dead{
			obj_player.state = states.fall{
				obj_player.xsp = (x-obj_player.x)*.08//sign(obj_player.x-x)*4
				obj_player.ysp = (y-obj_player.y)*.08//sign(obj_player.y-y)*4
			}
		}
	}else{
		if obj_player.state != states.dead{
			obj_player.state = states.fall{
				obj_player.xsp = (x-obj_player.x)*.1
				obj_player.ysp = (y-obj_player.y)*.1
				instance_destroy()
				scr_play_sound(snd_enemy_death)
				var flash = instance_create_layer(x,y,layer,obj_flash_2)
				flash.image_xscale = 2
				flash.image_yscale = 2
				scr_play_sound(snd_claw_attach)
				
				var dis = 35
				var dir = point_direction(obj_player.x,obj_player.y,x,y)
				for(var i = 0; i < 5; i++){
					instance_create_layer(x+lengthdir_x(dis*(i+2),dir),y+lengthdir_y(dis*(i+2),dir),layer,obj_flash_2)
					instance_create_layer(x+lengthdir_x(dis*(i+2),dir),y+lengthdir_y(dis*(i+2),dir),layer,obj_battery)
				}
				instance_create_layer(x,y,layer,obj_part_red)
				instance_create_layer(x,y,layer,obj_part_red)
				instance_create_layer(x,y,layer,obj_part_red)
				instance_create_layer(x,y,layer,obj_part_red)
				instance_create_layer(x,y,layer,obj_part_red_eyes)
				
				
			}
		}
	}
}

