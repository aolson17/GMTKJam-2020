
var arrow_length = 20
draw_self()
draw_set_color(c_blue)
//draw_arrow(x+sprite_width/2-lengthdir_x(arrow_length,global.grav_dir),y+sprite_height/2-lengthdir_y(arrow_length,global.grav_dir),x+sprite_width/2+lengthdir_x(arrow_length,global.grav_dir),y+sprite_height/2+lengthdir_y(arrow_length,global.grav_dir),10)


var offset = 1

var arrow_size = 13
var arrow_x = x+sprite_width/2
var arrow_y = y+sprite_height/2
draw_set_color(c_black)
draw_arrow(arrow_x+offset-lengthdir_x(arrow_length,global.grav_dir),arrow_y-lengthdir_y(arrow_length,global.grav_dir),arrow_x+offset+lengthdir_x(arrow_length,global.grav_dir),arrow_y+lengthdir_y(arrow_length,global.grav_dir),arrow_size)
draw_arrow(arrow_x-offset-lengthdir_x(arrow_length,global.grav_dir),arrow_y-lengthdir_y(arrow_length,global.grav_dir),arrow_x-offset+lengthdir_x(arrow_length,global.grav_dir),arrow_y+lengthdir_y(arrow_length,global.grav_dir),arrow_size)
draw_arrow(arrow_x-lengthdir_x(arrow_length,global.grav_dir),arrow_y+offset-lengthdir_y(arrow_length,global.grav_dir),arrow_x+lengthdir_x(arrow_length,global.grav_dir),arrow_y+offset+lengthdir_y(arrow_length,global.grav_dir),arrow_size)
draw_arrow(arrow_x-lengthdir_x(arrow_length,global.grav_dir),arrow_y-offset-lengthdir_y(arrow_length,global.grav_dir),arrow_x+lengthdir_x(arrow_length,global.grav_dir),arrow_y-offset+lengthdir_y(arrow_length,global.grav_dir),arrow_size)
draw_set_color(make_color_rgb(0,120,248))
draw_arrow(arrow_x-lengthdir_x(arrow_length,global.grav_dir),arrow_y-lengthdir_y(arrow_length,global.grav_dir),arrow_x+lengthdir_x(arrow_length,global.grav_dir),arrow_y+lengthdir_y(arrow_length,global.grav_dir),arrow_size)

