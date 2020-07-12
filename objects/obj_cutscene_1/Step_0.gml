


switch(image_num){
	case 0: text_obj.text_str = text_obj.text_1
		break
	case 1: text_obj.text_str = text_obj.text_2
		break
	case 2: text_obj.text_str = text_obj.text_3
		break
	case 3: text_obj.text_str = text_obj.text_4
		break
	case 4: text_obj.text_str = text_obj.text_4
		break
}



if keyboard_check_pressed(ord("E")) || mouse_check_button_pressed(mb_left){
	image_num++
}

if image_num >image_number-1 && !made_transition{
	var transition = instance_create_layer(x,y,"Cursor",obj_transition)
	transition.room_target = room+1
	made_transition = true
}else{
	image_index = image_num
}