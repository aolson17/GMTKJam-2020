/// @description Create Leaves




if room != rm_menu{
	repeat(leaf_amount){
	
		var x_ = irandom_range(obj_camera.x-leaf_radius*obj_camera.zoom,obj_camera.x+leaf_radius*obj_camera.zoom)
		var y_ = irandom_range(obj_camera.y-leaf_radius*obj_camera.zoom,obj_camera.y+leaf_radius*obj_camera.zoom)
	
		instance_create_layer(x_,y_,"Particles",obj_leaf)
	
	
	}
}else{
	repeat(leaf_amount*.3){
	
		var x_ = irandom_range(0,room_width)
		var y_ = irandom_range(0,room_height)
	
		instance_create_layer(x_,y_,"Particles",obj_leaf)
	
	
	}
}

alarm[0] = leaf_time






