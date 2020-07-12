


if obj_player.state = states.shoot{
	image_angle = point_direction(0,0,xsp,ysp)
	sprite_index = spr_claw_open
	
	if collision_line(x,y,x+xsp*2,y+ysp*2,par_solid,true,true){
		while(!place_meeting(x,y,par_solid)){
			x+=sign(xsp/(abs(xsp)+abs(ysp)))
			y+=sign(ysp/(abs(xsp)+abs(ysp)))
		}
		scr_play_sound(snd_claw_attach)
		xsp = 0
		ysp = 0
		obj_player.state = states.swing
		obj_player.grapple_dir = point_direction(x,y,obj_player.x,obj_player.y)
		
		
		
		obj_player.asp = -angle_difference(point_direction(x,y,obj_player.x,obj_player.y),point_direction(x,y,obj_player.x+obj_player.xsp,obj_player.y+obj_player.ysp))
		obj_player.grapple_length = point_distance(x,y,obj_player.x,obj_player.y)
		
		
		
		
	}else{
		x += xsp
		y += ysp
		//scr_collision()
	}
}else if obj_player.state = states.fall{
	sprite_index = spr_claw_closed
	
	if !obj_player.shoot_key_down{
		if prev_x != x || prev_y != y{
			image_angle = point_direction(x,y,prev_x,prev_y)
		}
	}
	prev_x = x
	prev_y = y
}else{
	sprite_index = spr_claw_closed
}

if obj_player.state = states.dead{
	visible = false
}

