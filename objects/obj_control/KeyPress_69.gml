/// @description Advance to next room after winning


if global.won && room != rm_win{
	var transition = instance_create_layer(x,y,"cursor",obj_transition)
	transition.room_target = room+1
}
