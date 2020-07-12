



draw_self()

scr_draw_outline_scaled(x-6,y-8+y_offset*2,"?",c_white,obj_control.dark,1,2)

if y_offset = 1{
	par_non_help_menu.visible = false
	
	draw_set_halign(fa_center)
	
	var start = 30
	var increase = 25
	
	scr_draw_outline_scaled(x,y+start+increase*0,"Controls",c_white,obj_control.dark,2,2)
	scr_draw_outline_scaled(x,y+start+increase*2,"WASD to move perpindicular to gravity",c_white,obj_control.dark,2,2)
	scr_draw_outline_scaled(x,y+start+increase*3,"Left mouse button to aim and shoot grapple",c_white,obj_control.dark,2,2)
	scr_draw_outline_scaled(x,y+start+increase*4,"Shift Space and Right Mouse button control length",c_white,obj_control.dark,2,2)
	scr_draw_outline_scaled(x,y+start+increase*5,"F to toggle fullscreen",c_white,obj_control.dark,2,2)
	scr_draw_outline_scaled(x,y+start+increase*6,"R to restart level",c_white,obj_control.dark,2,2)
	scr_draw_outline_scaled(x,y+start+increase*7,"Escape to return to menu or exit",c_white,obj_control.dark,2,2)
	scr_draw_outline_scaled(x,y+start+increase*8,"Collect batteries to advance",c_white,obj_control.dark,2,2)
	scr_draw_outline_scaled(x,y+start+increase*9,"Unlocked levels are saved",c_white,obj_control.dark,2,2)
	
	draw_set_halign(fa_left)

}else{
	par_non_help_menu.visible = true
}
