



if mouse_check_button_pressed(mb_middle){
	m_mouse_x_prev = mouse_x
	m_mouse_y_prev = mouse_y
}

if mouse_check_button_released(mb_middle){
	global.grav_dir = round(point_direction(m_mouse_x_prev,m_mouse_y_prev,mouse_x,mouse_y)/10)*10
}
