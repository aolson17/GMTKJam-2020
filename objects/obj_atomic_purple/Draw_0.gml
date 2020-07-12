


draw_self()

if state = atomic_states.attack{
	draw_sprite_ext(spr_flash_2,0,x,y,1,1,image_angle,c_white,1)
}


var real_eye_sprite = eye_sprite

if electric_eyes{
	real_eye_sprite = spr_atomic_purple_eyes_electric
}

draw_sprite_ext(eye_sprite,0,x,y,1,1,image_angle,c_white,1)




