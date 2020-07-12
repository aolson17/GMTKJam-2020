



/*if keyboard_check_pressed(vk_tab){
	update_surf = true
	
	surface_x = obj_player.x-surf_w/2
	surface_y = obj_player.y-surf_h/2
}*/

if point_distance(obj_player.x,obj_player.y,surface_x+surf_w/2,surface_y+surf_h/2) > 500{
	
	update_surf = true
	
	surface_x = obj_player.x-surf_w/2
	surface_y = obj_player.y-surf_h/2
}

