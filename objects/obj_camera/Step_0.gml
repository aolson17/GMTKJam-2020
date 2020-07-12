
if instance_number(obj_player)>0 && obj_player.state = states.shoot{
	mouse_factor = 0+base_mouse_factor*(zoom+.5)
}else{
	mouse_factor = base_mouse_factor*(zoom+.5)
}

if instance_number(target)>0{
	if target = noone{ // TODO change when necessary
		x = target.x
		y = target.y
	}else{
		target_x = (target.x)+(mouse_x-target.x)*mouse_factor
		target_y = (target.y)+(mouse_y-target.y)*mouse_factor
		
		if obj_player.state != states.dead{
			x += spd_factor*(target_x-x+shake_offset_x)
			y += spd_factor*(target_y-y+shake_offset_y)
		}else{
			x += spd_factor*(obj_player.dead_x-x+shake_offset_x)
			y += spd_factor*(obj_player.dead_y-y+shake_offset_y)
		}
	}
}

if obj_player.state = states.swing{
	var player_spd = obj_player.asp * (2*pi*obj_player.grapple_length)/360
}else{
	var player_spd = point_distance(0,0,obj_player.xsp,obj_player.ysp)
}
zoom_target = .5+(max(player_spd-min_speed_zoom,0)/(max_speed_zoom-min_speed_zoom))*1.5//.5

if obj_player.state = states.dead{
	zoom_target = .5
}

zoom += .05*(zoom_target-zoom)



/*if mouse_wheel_down(){
	zoom *= 1.2
}
if mouse_wheel_up(){
	zoom *= .9
}*/
zoom_width = width * zoom
zoom_height = height * zoom

//zoom = 20

if shake > 0{
	shake_offset_x = choose(-1,1)*((irandom(shake)+1)*4)
	shake_offset_y = choose(-1,1)*((irandom(shake)+1)*4)
	shake--
}else{
	shake_offset_x = 0
	shake_offset_y = 0
}

target_angle = -global.grav_dir - 90

if abs(angle_difference(angle,target_angle))>1{
	angle += sin(degtorad(target_angle - angle)) * 20
	//angle += angle_difference(angle,global.grav_dir-90)*.05
}else{
	angle = target_angle
}
angle = 0

camera_set_view_angle(camera,angle)

camera_set_view_pos(camera, (x-zoom_width/2), (y-zoom_height/2))
camera_set_view_size(camera,zoom_width,zoom_height)