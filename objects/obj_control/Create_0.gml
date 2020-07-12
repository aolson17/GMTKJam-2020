

ini_open("data.ini")

global.levels_unlocked = ini_read_real("Data - You wouldn't skip our levels, would you?", "levels_unlocked", 0);

global.level_1_time = ini_read_real("Data","level_1_time",9999)
global.level_2_time = ini_read_real("Data","level_2_time",9999)
global.level_3_time = ini_read_real("Data","level_3_time",9999)
global.level_4_time = ini_read_real("Data","level_4_time",9999)
global.level_5_time = ini_read_real("Data","level_5_time",9999)
global.level_6_score = ini_read_real("Data","level_6_score",0)

ini_close()


randomize()


font = font_add_sprite_ext(spr_font,"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_!?():.,'",true,2)

draw_set_font(font)

dark = make_color_rgb(30,30,30)


global.grav_dir = 270

global.won = false


m_mouse_x_prev = mouse_x
m_mouse_y_prev = mouse_y



gravity_change_time_min = 3*60
gravity_change_time_max = 15*60

if room != rm_win && string_pos("Cutscene",room_get_name(room)) = 0{
	alarm[1] = 5*60
}