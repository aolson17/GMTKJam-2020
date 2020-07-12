if !surface_exists(terrain_surf){
	terrain_surf = surface_create(surf_w,surf_h)
	update_surf = true
}
if !surface_exists(border_surf){
	border_surf = surface_create(surf_w,surf_h)
}
if !surface_exists(border_surf_2){
	border_surf_2 = surface_create(surf_w,surf_h)
}
if update_surf{
	update_surf = false
	show_debug_message(string(random(10))+" Update Surf")
	
	surface_set_target(terrain_surf)
	draw_clear_alpha(c_black,0)
	
	with(obj_terrain){
		draw_sprite_ext(sprite_index,0,x-other.surface_x,y-other.surface_y,image_xscale,image_yscale,image_angle,c_white,1)
	}
	
	gpu_set_blendmode_ext(bm_dest_alpha, bm_zero)
	
	//draw_clear(c_black)
	//draw_sprite_tiled(texture,0,0,0)
	draw_sprite_tiled(spr_black,0,0,0)
	
	
	gpu_set_blendmode(bm_normal)
	
	surface_reset_target()
	
	
	//surf = scr_edge_surface(terrain_surf,texture,border,16)
	
	
	
	
	surface_set_target(border_surf)
	draw_clear(c_black)
	//draw_sprite_tiled(border,0,0,0)
	
	/*draw_surface(terrain_surf,border_size,0)
	draw_surface(terrain_surf,0,border_size)
	draw_surface(terrain_surf,-border_size,0)
	draw_surface(terrain_surf,0,-border_size)
	draw_surface(terrain_surf,-border_size,-border_size)
	draw_surface(terrain_surf,border_size,border_size)
	draw_surface(terrain_surf,-border_size,border_size)
	draw_surface(terrain_surf,border_size,-border_size)*/
	
	gpu_set_blendmode(bm_subtract)
	draw_surface(terrain_surf,0,0)
	gpu_set_blendmode(bm_normal)
	
	surface_reset_target()
	
	//surface_set_target(border_surf)
	
	//draw_surface(border_surf,10,0)
	//draw_surface(border_surf,0,border_size)
	//draw_surface(border_surf,-border_size,0)
	//draw_surface(border_surf,0,-border_size)
	
	//surface_reset_target()
	
	surface_set_target(border_surf_2)
	draw_clear_alpha(c_black,0)
	draw_surface(border_surf,border_size,0)
	draw_surface(border_surf,0,border_size)
	draw_surface(border_surf,-border_size,0)
	draw_surface(border_surf,0,-border_size)
	
	gpu_set_blendmode_ext(bm_dest_alpha, bm_one)
	draw_sprite_tiled(border,0,0,0)
	gpu_set_blendmode(bm_normal)
	
	surface_reset_target()
	
	
	surface_set_target(terrain_surf)
	
	gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_src_colour)
	
	draw_sprite_tiled(texture,0,0,0)
	
	draw_surface(border_surf_2,0,0)
	
	gpu_set_blendmode(bm_normal)
	
	surface_reset_target()
}


draw_surface(terrain_surf,surface_x,surface_y)//terrain_surf

