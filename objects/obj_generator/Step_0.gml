


if point_distance(active_x,active_y, obj_player.x,obj_player.y) > active_range/3{
	event_user(0)
}



if (obj_player.x-generate_range) < (must_generate_l){
	must_generate_l = obj_player.x-generate_range
	
	while abs(must_generate_l - generated_l) > cell_size{ // Room to generate
		generated_l -= cell_size
		
		var generate_amount = terrain_per_square_pixel*((cell_size*abs(generated_d-generated_u)))
		repeat(generate_amount){
			scr_new_terrain(generated_l-cell_size,generated_l,generated_u,generated_d)
		}
		var generate_amount = monitor_per_square_pixel*((cell_size*abs(generated_d-generated_u)))
		repeat(generate_amount){
			scr_new_monitor(generated_l-cell_size,generated_l,generated_u,generated_d)
		}
	}
	
	
}

if (obj_player.x+generate_range) > (must_generate_r){
	must_generate_r = obj_player.x+generate_range
	
	
	while abs(must_generate_r - generated_r) > cell_size{ // Room to generate
		generated_r += cell_size
		
		var generate_amount = terrain_per_square_pixel*((cell_size*abs(generated_d-generated_u)))
		repeat(generate_amount){
			scr_new_terrain(generated_r,generated_r+cell_size,generated_u,generated_d)
		}
		var generate_amount = monitor_per_square_pixel*((cell_size*abs(generated_d-generated_u)))
		repeat(generate_amount){
			scr_new_monitor(generated_r,generated_r+cell_size,generated_u,generated_d)
		}
	}
}

if (obj_player.y-generate_range) < (must_generate_u){
	must_generate_u = obj_player.y-generate_range
	
	
	while abs(must_generate_u - generated_u) > cell_size{ // Room to generate
		generated_u -= cell_size
		
		var generate_amount = terrain_per_square_pixel*((cell_size*abs(generated_l-generated_r)))
		repeat(generate_amount){
			scr_new_terrain(generated_l,generated_r,generated_u-cell_size,generated_u)
		}
		var generate_amount = monitor_per_square_pixel*((cell_size*abs(generated_l-generated_r)))
		repeat(generate_amount){
			scr_new_monitor(generated_l,generated_r,generated_u-cell_size,generated_u)
		}
	}
}

if (obj_player.y+generate_range) > (must_generate_d){
	must_generate_d = obj_player.y+generate_range
	
	while abs(must_generate_d - generated_d) > cell_size{ // Room to generate
		generated_d += cell_size
		
		var generate_amount = terrain_per_square_pixel*((cell_size*abs(generated_l-generated_r)))
		repeat(generate_amount){
			scr_new_terrain(generated_l,generated_r,generated_d+cell_size,generated_d)
		}
		var generate_amount = monitor_per_square_pixel*((cell_size*abs(generated_l-generated_r)))
		repeat(generate_amount){
			scr_new_monitor(generated_l,generated_r,generated_d+cell_size,generated_d)
		}
	}
}





















/*player_cell_x = round(obj_player.x/cell_size) OLD IDEA FOR GENERATION
player_cell_y = round(obj_player.y/cell_size)

var load_min_i = max(player_cell_x-load_range,0)
var load_max_i = min(player_cell_x+load_range,ds_grid_width(grid_br))

var load_min_j = max(player_cell_y-load_range,0)
var load_max_j = min(player_cell_y+load_range,ds_grid_width(grid_br))

for (i = load_min_i; i < load_max_i; i++){
	for (i = load_min_i; i < load_max_i; i++){
		var cell = ds_grid_get(grid_br,i,j)
		if cell = noone{
			// Must generate new cell
		}else{
			for (k = 0; k < ds_list_size(cell); k++){
				
			}
		}
	}
}*/






