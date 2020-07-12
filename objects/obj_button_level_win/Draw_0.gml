

if global.levels_unlocked > 4{
	draw_self()
	
	scr_draw_outline_scaled(x+56,y+6+y_offset*2,"End",c_white,obj_control.dark,1,2)
}else{
	image_index = 2
	draw_self()
}
