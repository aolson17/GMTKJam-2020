if !surface_exists(ui_surf){
	ui_surf = surface_create(surf_w,surf_h)
}
if room != rm_win{
	surface_set_target(ui_surf)
	draw_clear_alpha(c_black,0)

	draw_sprite(spr_battery_icon,0,10,30)


	scr_draw_outline(15+sprite_get_width(spr_battery_icon),32,"x "+string(obj_player.batteries),c_white,c_black,1)

	scr_draw_outline(5,5,room_get_name(room),c_white,c_black,1)

	if global.won{
		scr_draw_outline(50,5," Complete!",c_white,c_black,1)
		scr_draw_outline(60,25,"Press E to advance!",c_white,c_black,1)
	}else{
		scr_draw_outline(2,42,"You Need "+string(obj_generator.target_batteries),c_white,c_black,1)
	}


	//draw_text(15+sprite_get_width(spr_battery_icon),32,)

	var heart_y = 17

	if obj_player.hp = 3{
		draw_sprite(spr_heart,0,10,heart_y)
		draw_sprite(spr_heart,0,25,heart_y)
		draw_sprite(spr_heart,0,40,heart_y)
	}else if obj_player.hp = 2{
		draw_sprite(spr_heart,0,10,heart_y)
		draw_sprite(spr_heart,0,25,heart_y)
		draw_sprite(spr_heart_empty,0,40,heart_y)
	}else if obj_player.hp = 1{
		draw_sprite(spr_heart_red,0,10,heart_y)
		draw_sprite(spr_heart_empty,0,25,heart_y)
		draw_sprite(spr_heart_empty,0,40,heart_y)
	}else{
		draw_sprite(spr_heart_empty,0,10,heart_y)
		draw_sprite(spr_heart_empty,0,25,heart_y)
		draw_sprite(spr_heart_empty,0,40,heart_y)
	}

	var arrow_length = 20
	var arrow_size = 10
	var arrow_x = 230
	var arrow_y = 22
	draw_set_color(c_black)
	draw_arrow(arrow_x+1-lengthdir_x(arrow_length,global.grav_dir),arrow_y-lengthdir_y(arrow_length,global.grav_dir),arrow_x+1+lengthdir_x(arrow_length,global.grav_dir),arrow_y+lengthdir_y(arrow_length,global.grav_dir),arrow_size)
	draw_arrow(arrow_x-1-lengthdir_x(arrow_length,global.grav_dir),arrow_y-lengthdir_y(arrow_length,global.grav_dir),arrow_x-1+lengthdir_x(arrow_length,global.grav_dir),arrow_y+lengthdir_y(arrow_length,global.grav_dir),arrow_size)
	draw_arrow(arrow_x-lengthdir_x(arrow_length,global.grav_dir),arrow_y+1-lengthdir_y(arrow_length,global.grav_dir),arrow_x+lengthdir_x(arrow_length,global.grav_dir),arrow_y+1+lengthdir_y(arrow_length,global.grav_dir),arrow_size)
	draw_arrow(arrow_x-lengthdir_x(arrow_length,global.grav_dir),arrow_y-1-lengthdir_y(arrow_length,global.grav_dir),arrow_x+lengthdir_x(arrow_length,global.grav_dir),arrow_y-1+lengthdir_y(arrow_length,global.grav_dir),arrow_size)
	draw_set_color(c_white)
	draw_arrow(arrow_x-lengthdir_x(arrow_length,global.grav_dir),arrow_y-lengthdir_y(arrow_length,global.grav_dir),arrow_x+lengthdir_x(arrow_length,global.grav_dir),arrow_y+lengthdir_y(arrow_length,global.grav_dir),arrow_size)


	surface_reset_target()

	draw_surface_ext(ui_surf,0,0,3,3,0,c_white,1)
}

