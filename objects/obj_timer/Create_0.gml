

ini_open("data.ini")

global.level_1_time = ini_read_real("Data","level_1_time",9999)
global.level_2_time = ini_read_real("Data","level_2_time",9999)
global.level_3_time = ini_read_real("Data","level_3_time",9999)
global.level_4_time = ini_read_real("Data","level_4_time",9999)
global.level_5_time = ini_read_real("Data","level_5_time",9999)
global.level_6_score = ini_read_real("Data","level_6_score",0)


ini_close()


time = 60

if room = rm_win{
	height = global.level_6_score
}else{
	timer = 0
	alarm[0] = time
}




