


generate_range = 600



terrain_per_square_pixel = .000008



generated_l = -100 // How far in each direction has been generated
generated_r = 100
generated_u = -100
generated_d = 100
must_generate_l = generated_l // How far in each direction has been in generating range so should be generated
must_generate_r = generated_r
must_generate_u = generated_u
must_generate_d = generated_d

cell_size = 500 // How long to wait before generating in a direction so there is more randomness in placement


active_range = 2500

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




