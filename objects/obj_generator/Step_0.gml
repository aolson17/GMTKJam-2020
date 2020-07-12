


if point_distance(active_x,active_y, obj_player.x,obj_player.y) > active_range/4{
	event_user(0)
}



if (obj_player.x-generate_range) < (must_generate_l){
	must_generate_l = obj_player.x-generate_range
	
	while abs(must_generate_l - generated_l) > cell_size{ // Room to generate
		generated_l -= cell_size
		
		var generate_factor = ((cell_size*abs(generated_d-generated_u)))
		var x1 = generated_l-cell_size
		var x2 = generated_l
		var y1 = generated_u
		var y2 = generated_d
		
		var generate_amount = terrain_per_square_pixel*generate_factor
		repeat(generate_amount){
			scr_new_terrain(x1,x2,y1,y2)
		}
		var generate_amount = monitor_per_square_pixel*generate_factor
		repeat(generate_amount){
			scr_new_monitor(x1,x2,y1,y2)
		}
		var generate_amount = battery_per_square_pixel*generate_factor
		repeat(generate_amount){
			scr_new_battery(x1,x2,y1,y2)
		}
		var generate_amount = battery_block_per_square_pixel*generate_factor
		repeat(generate_amount){
			scr_new_battery_block(x1,x2,y1,y2)
		}
		var generate_amount = spike_per_square_pixel*generate_factor
		repeat(generate_amount){
			scr_new_spike(x1,x2,y1,y2)
		}
		var generate_amount = red_per_square_pixel*generate_factor
		repeat(generate_amount){
			scr_new_obj(x1,x2,y1,y2,obj_atomic_red)
		}
	}
}

if (obj_player.x+generate_range) > (must_generate_r){
	must_generate_r = obj_player.x+generate_range
	
	
	while abs(must_generate_r - generated_r) > cell_size{ // Room to generate
		generated_r += cell_size
		
		var generate_factor = ((cell_size*abs(generated_d-generated_u)))
		var x1 = generated_r
		var x2 = generated_r+cell_size
		var y1 = generated_u
		var y2 = generated_d
		
		var generate_amount = terrain_per_square_pixel*generate_factor
		repeat(generate_amount){
			scr_new_terrain(x1,x2,y1,y2)
		}
		var generate_amount = monitor_per_square_pixel*generate_factor
		repeat(generate_amount){
			scr_new_monitor(x1,x2,y1,y2)
		}
		var generate_amount = battery_per_square_pixel*generate_factor
		repeat(generate_amount){
			scr_new_battery(x1,x2,y1,y2)
		}
		var generate_amount = battery_block_per_square_pixel*generate_factor
		repeat(generate_amount){
			scr_new_battery_block(x1,x2,y1,y2)
		}
		var generate_amount = spike_per_square_pixel*generate_factor
		repeat(generate_amount){
			scr_new_spike(x1,x2,y1,y2)
		}
		var generate_amount = red_per_square_pixel*generate_factor
		repeat(generate_amount){
			scr_new_obj(x1,x2,y1,y2,obj_atomic_red)
		}
	}
}

if (obj_player.y-generate_range) < (must_generate_u){
	must_generate_u = obj_player.y-generate_range
	
	
	while abs(must_generate_u - generated_u) > cell_size{ // Room to generate
		generated_u -= cell_size
		
		var generate_factor = ((cell_size*abs(generated_l-generated_r)))
		var x1 = generated_l
		var x2 = generated_r
		var y1 = generated_u-cell_size
		var y2 = generated_u
		
		var generate_amount = terrain_per_square_pixel*generate_factor
		repeat(generate_amount){
			scr_new_terrain(x1,x2,y1,y2)
		}
		var generate_amount = monitor_per_square_pixel*generate_factor
		repeat(generate_amount){
			scr_new_monitor(x1,x2,y1,y2)
		}
		var generate_amount = battery_per_square_pixel*generate_factor
		repeat(generate_amount){
			scr_new_battery(x1,x2,y1,y2)
		}
		var generate_amount = battery_block_per_square_pixel*generate_factor
		repeat(generate_amount){
			scr_new_battery_block(x1,x2,y1,y2)
		}
		var generate_amount = spike_per_square_pixel*generate_factor
		repeat(generate_amount){
			scr_new_spike(x1,x2,y1,y2)
		}
		var generate_amount = red_per_square_pixel*generate_factor
		repeat(generate_amount){
			scr_new_obj(x1,x2,y1,y2,obj_atomic_red)
		}
	}
}

if (obj_player.y+generate_range) > (must_generate_d){
	must_generate_d = obj_player.y+generate_range
	
	while abs(must_generate_d - generated_d) > cell_size{ // Room to generate
		generated_d += cell_size
		
		var generate_factor = ((cell_size*abs(generated_l-generated_r)))
		var x1 = generated_l
		var x2 = generated_r
		var y1 = generated_d+cell_size
		var y2 = generated_d
		
		var generate_amount = terrain_per_square_pixel*generate_factor
		repeat(generate_amount){
			scr_new_terrain(x1,x2,y1,y2)
		}
		var generate_amount = monitor_per_square_pixel*generate_factor
		repeat(generate_amount){
			scr_new_monitor(x1,x2,y1,y2)
		}
		var generate_amount = battery_per_square_pixel*generate_factor
		repeat(generate_amount){
			scr_new_battery(x1,x2,y1,y2)
		}
		var generate_amount = battery_block_per_square_pixel*generate_factor
		repeat(generate_amount){
			scr_new_battery_block(x1,x2,y1,y2)
		}
		var generate_amount = spike_per_square_pixel*generate_factor
		repeat(generate_amount){
			scr_new_spike(x1,x2,y1,y2)
		}
		var generate_amount = red_per_square_pixel*generate_factor
		repeat(generate_amount){
			scr_new_obj(x1,x2,y1,y2,obj_atomic_red)
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






