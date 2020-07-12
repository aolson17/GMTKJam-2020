/// @description Unlock all levels


if room = rm_menu{
	global.levels_unlocked = 5
}else{
	obj_player.batteries++
}