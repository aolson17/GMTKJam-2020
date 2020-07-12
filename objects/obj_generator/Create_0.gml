


generate_range = 600


switch(room){
	case (Level_1):
		terrain_per_square_pixel = .00001
		monitor_per_square_pixel = .00001
		battery_per_square_pixel = .00001
		battery_block_per_square_pixel = .000008
		spike_per_square_pixel = 0
		red_per_square_pixel = 0
		purple_per_square_pixel = 0
		target_batteries = 30
	break
	case (Level_2):
		terrain_per_square_pixel = .000008
		monitor_per_square_pixel = .00001
		battery_per_square_pixel = .00001
		battery_block_per_square_pixel = .000005
		spike_per_square_pixel = .000004
		red_per_square_pixel = 0
		purple_per_square_pixel = 0
		target_batteries = 40
	break
	case (Level_3):
		terrain_per_square_pixel = .000018
		monitor_per_square_pixel = .00001
		battery_per_square_pixel = .000002
		battery_block_per_square_pixel = .000002
		spike_per_square_pixel = .000005
		red_per_square_pixel = .000011
		purple_per_square_pixel = 0
		target_batteries = 25
	break
	case (Level_4):
		terrain_per_square_pixel = .000008
		monitor_per_square_pixel = .00001
		battery_per_square_pixel = .00002
		battery_block_per_square_pixel = .000005
		spike_per_square_pixel = .00001
		red_per_square_pixel = .000003
		purple_per_square_pixel = .000007
		target_batteries = 45
	break
	case (Level_5):
		terrain_per_square_pixel = .00001
		monitor_per_square_pixel = .00001
		battery_per_square_pixel = .00001
		battery_block_per_square_pixel = .000004
		spike_per_square_pixel = .000005
		red_per_square_pixel = .000003
		purple_per_square_pixel = .000003
		target_batteries = 80
	break
}

generated_l = -50 // How far in each direction has been generated
generated_r = 50
generated_u = -50
generated_d = 50
must_generate_l = generated_l // How far in each direction has been in generating range so should be generated
must_generate_r = generated_r
must_generate_u = generated_u
must_generate_d = generated_d

cell_size = 500 // How long to wait before generating in a direction so there is more randomness in placement


active_range = 3000

active_x = 0 // Where the center of the active area is
active_y = 0

deactivate_time = 10


alarm[0] = 1






/*start_size = 500
cell_size = 500
load_range = 2

grid_br = ds_grid_create(start_size,start_size) OLD IDEA FOR GENERATION
grid_bl = ds_grid_create(start_size,start_size)
grid_tr = ds_grid_create(start_size,start_size)
grid_tl = ds_grid_create(start_size,start_size)

ds_grid_clear(grid_br, noone)
ds_grid_clear(grid_bl, noone)
ds_grid_clear(grid_tr, noone)
ds_grid_clear(grid_tl, noone)*/




