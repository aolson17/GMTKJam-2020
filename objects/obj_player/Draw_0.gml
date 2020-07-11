


line_color = make_color_hsv(202,100,71)
line_color = make_color_rgb(0,149,238)
line_color_back = make_color_rgb(0,113,180)


scr_draw_tail(1,0,c_black,c_black)
scr_draw_tail(-1,0,c_black,c_black)
scr_draw_tail(0,1,c_black,c_black)
scr_draw_tail(0,-1,c_black,c_black)
scr_draw_tail(0,0,line_color,line_color_back)



draw_sprite_ext(spr_body_base,0,x,y,1,1,image_angle,c_white,1)

var face_angle = point_direction(0,0,xsp,ysp)
if on_ground{
	if shoot_key_down{
		face_angle = point_direction(x,y,mouse_x,mouse_y)
	}else{
		if point_distance(0,0,xsp,ysp) != 0{
			face_angle = point_direction(0,0,xsp,ysp)
		}
	}
}else{
	if state = states.swing{
		face_angle = point_direction(x,y,obj_grapple.x,obj_grapple.y)
	}else{
		face_angle = point_direction(0,0,xsp,ysp)
	}
}

if sign(angle_difference(face_angle,global.grav_dir)) != 0{
	facing = sign(angle_difference(face_angle,global.grav_dir))
}

draw_sprite_ext(spr_eyes_normal,0,x,y,facing,1,global.grav_dir+90,c_white,1)


