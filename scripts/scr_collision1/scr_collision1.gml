

var col_list = ds_list_create()
ds_list_clear(col_list)
instance_place_list((x+xsp),(y),par_solid,col_list,true)

var col = noone
for(var i = 0; i < ds_list_size(col_list); i++){
	if col_list[|i].layer = layer{
		col = col_list[|i]
		break
	}
}
if col != noone{
	var limit = abs(xsp)
	while(!place_meeting((x+sign(xsp)*.01),(y),col) && limit > 0){
		x += sign(xsp)*.01
		limit -= abs(sign(xsp)*.01)
	}
	if object_index = obj_player{
		if abs(xsp) > 0 && move = sign(xsp) && (state = run){
			if !place_meeting((x+sign(xsp)*.01),(y-step_size),col){
				y -= step_size
				ysp = 0
				while(!place_meeting((x+sign(xsp)*.01),(y),col) && limit > 0){
					x += sign(xsp)*.01
					limit -= abs(sign(xsp)*.01)
				}
			
				xsp = clamp(xsp,-max_stair_speed,max_stair_speed)
			}else{
				xsp = 0
			}
		}else{
			xsp = 0
		}
	}else{
		xsp = 0
	}
}else{
	x += xsp
}

ds_list_clear(col_list)
instance_place_list((x),(y+ysp),par_solid,col_list,true)

var col = noone
for(var i = 0; i < ds_list_size(col_list); i++){
	if col_list[|i].layer = layer{
		col = col_list[|i]
		break
	}
}
if col != noone{
	var limit = abs(ysp)
	while(!place_meeting((x),(y+sign(ysp)),col) && limit > 0){
		//show_debug_message("while y")
		y += sign(ysp)
		limit -= abs(sign(ysp))
	}
	if ysp > 0{ // If landing on ground
		y = round(y)
	}
	if place_meeting(x,y,col){
		y--
		show_debug_message("Adjusting y from collision")
	}
	ysp = 0
}else{
	y += ysp
}

ds_list_destroy(col_list)


