

if instance_number(target)>0{
	if target = noone{ // TODO change when necessary
		x = target.x
		y = target.y
	}else{
		target_x = (target.x)
		target_y = (target.y)
		
		x += spd_factor*(target_x-x+shake_offset_x)
		y += spd_factor*(target_y-y+shake_offset_y)
	}
}

if mouse_wheel_down(){
	zoom *= 1.2
}
if mouse_wheel_up(){
	zoom *= .9
}
zoom_width = width * zoom
zoom_height = height * zoom

if shake > 0{
	shake_offset_x = choose(-1,1)*((irandom(shake)+1)*4)
	shake_offset_y = choose(-1,1)*((irandom(shake)+1)*4)
	shake--
}else{
	shake_offset_x = 0
	shake_offset_y = 0
}

camera_set_view_pos(camera, (x-zoom_width/2), (y-zoom_height/2))
camera_set_view_size(camera,zoom_width,zoom_height)