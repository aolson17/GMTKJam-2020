
if !made_transition{
	text_obj.text_str = text_obj.text[|image_num]

	if keyboard_check_pressed(ord("E")) || mouse_check_button_pressed(mb_left){
		image_num++
		scr_play_sound(snd_menu)
	}

	if image_num >image_number-1{
		var transition = instance_create_layer(x,y,"Cursor",obj_transition)
		transition.room_target = room+1
		made_transition = true
	}else{
		image_index = image_num
	}
}