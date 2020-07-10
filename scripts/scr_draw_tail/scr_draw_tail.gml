
var offset_x = argument0
var offset_y = argument1
var col_1 = argument2
var col_2 = argument3


var line_segments = 30

var prev_line_x = x
var prev_line_y = y
for (var i = 0; i < line_segments; i++){
	
	var line_pos_x = x+(i/line_segments)*(obj_grapple.x-x)
	var line_pos_y = y+(i/line_segments)*(obj_grapple.y-y)
	
	var a = 10*(1-(grapple_distance/grapple_length_max))
	var b = 1
	
	var sin_val = a*sin(i/b)
	
	var sin_x = lengthdir_x(sin_val,point_direction(x,y,obj_grapple.x,obj_grapple.y)-90)
	var sin_y = lengthdir_y(sin_val,point_direction(x,y,obj_grapple.x,obj_grapple.y)-90)
	
	if i%2 = 0{
		var col = col_1
		var this_line_x = line_pos_x+sin_x
		var this_line_y = line_pos_y+sin_y
	}else{
		var col = col_2
		var this_line_x = line_pos_x-sin_x
		var this_line_y = line_pos_y-sin_y
	}
	
	draw_line_width_color(prev_line_x+offset_x,prev_line_y+offset_y,this_line_x+offset_x,this_line_y+offset_y,1,col,col)
	
	var prev_line_x = this_line_x
	var prev_line_y = this_line_y
	
	
}

