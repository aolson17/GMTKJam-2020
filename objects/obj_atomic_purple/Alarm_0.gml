/// @description Start attack


state = atomic_states.attack


//xsp = (obj_player.x-x)*.03
//ysp = (obj_player.y-y)*.03

xsp = lengthdir_x(2.8,point_direction(x,y,obj_player.x,obj_player.y))
ysp = lengthdir_y(2.8,point_direction(x,y,obj_player.x,obj_player.y))

scr_play_sound(snd_enemy_float)
