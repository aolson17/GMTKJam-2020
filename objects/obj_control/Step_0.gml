


if instance_number(obj_generator)>0{
	if obj_player.batteries >= obj_generator.target_batteries{
		global.won = true
		
		if instance_number(obj_timer) > 0{
			with(obj_timer){
				event_user(0)
			}
		}
		
		switch(room){
			case (Level_1):
				if global.levels_unlocked < 1{
					global.levels_unlocked = 1
				}
				break
			case (Level_2):
				if global.levels_unlocked < 2{
					global.levels_unlocked = 2
				}
				break
			case (Level_3):
				if global.levels_unlocked < 3{
					global.levels_unlocked = 3
				}
				break
			case (Level_4):
				if global.levels_unlocked < 4{
					global.levels_unlocked = 4
				}
				break
			case (Level_5):
				if global.levels_unlocked < 5{
					global.levels_unlocked = 5
				}
				break
		}
	}
}



if mouse_check_button_pressed(mb_middle){
	m_mouse_x_prev = mouse_x
	m_mouse_y_prev = mouse_y
}

if mouse_check_button_released(mb_middle){
	global.grav_dir = round(point_direction(m_mouse_x_prev,m_mouse_y_prev,mouse_x,mouse_y)/10)*10
}
