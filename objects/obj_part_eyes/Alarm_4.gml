/// @description Fall

grav_speed = 0.2

var sound = audio_play_sound(snd_taking_damage,0,0)
audio_sound_gain(sound,global.master_volume*global.sound_volume*.8,0)
//audio_sound_gain(sound,0,1500)

//xsp = image_xscale
//ysp = -3

xsp = lengthdir_x(-3,global.grav_dir)
ysp = lengthdir_y(-3,global.grav_dir)


/*falling = true

grav_speed = 0.2

var sound = audio_play_sound(snd_taking_damage,0,0)
audio_sound_gain(sound,global.master_volume*global.sound_volume*.8,0)
//audio_sound_gain(sound,0,1500)


//xsp = lengthdir_x(3,global.grav_dir)
//ysp = lengthdir_y(3,global.grav_dir)