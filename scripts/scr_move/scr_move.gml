


move = right_key-left_key
	
if abs(xsp + move*move_spd) < move_spd_max{
	xsp += move*move_spd
}else{
	if abs(xsp) < move_spd_max{
		xsp = sign(xsp + move*move_spd)*move_spd_max
	}
}

if on_ground{
	if move = 0{
		if abs(xsp)-fric >= 0{
			xsp -= fric*sign(xsp)
		}else{
			xsp = 0
		}
	}
}else{
	if ysp < fall_spd_max{
	ysp+=fall_spd
	}
}
	
scr_collision()
