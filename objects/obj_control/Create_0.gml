

ini_open("data.ini")

global.levels_unlocked = ini_read_real("Data - You wouldn't skip our levels, would you?", "levels_unlocked", 0);

ini_close()


randomize()


font = font_add_sprite_ext(spr_font,"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_!?()",true,2)

draw_set_font(font)

dark = make_color_rgb(30,30,30)


global.grav_dir = 270

global.won = false


m_mouse_x_prev = mouse_x
m_mouse_y_prev = mouse_y



gravity_change_time_min = 3*60
gravity_change_time_max = 15*60

if room != rm_win{
	alarm[1] = 5*60
}