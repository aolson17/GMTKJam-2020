

if global.levels_unlocked > 2{
	draw_self()
	
	scr_draw_outline_scaled(x+30,y+6+y_offset*2,"Level 4",c_white,obj_control.dark,1,2)
}else{
	image_index = 2
	draw_self()
}
