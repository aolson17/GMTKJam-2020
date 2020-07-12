

if global.levels_unlocked > 0{
	draw_self()
	
	scr_draw_outline_scaled(x+30,y+6+y_offset*2,"Level 2",c_white,obj_control.dark,1,2)
	
	var val = global.level_2_time

	if val != 9999{
		scr_draw_outline(x+20,y+40,"Best: "+string(val),c_white,c_black,1)
	}else{
		scr_draw_outline(x+20,y+40,"Best: None",c_white,c_black,1)
	}
}else{
	image_index = 2
	draw_self()
}
