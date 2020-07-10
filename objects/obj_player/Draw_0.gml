


line_color = make_color_hsv(202,100,71)
line_color = make_color_rgb(0,149,238)
line_color_back = make_color_rgb(0,113,180)


scr_draw_tail(1,0,c_black,c_black)
scr_draw_tail(-1,0,c_black,c_black)
scr_draw_tail(0,1,c_black,c_black)
scr_draw_tail(0,-1,c_black,c_black)
scr_draw_tail(0,0,line_color,line_color_back)



//draw_line_width(x,y,obj_grapple.x,obj_grapple.y,3)





draw_sprite_ext(spr_body_base,0,x,y,1,1,image_angle,c_white,1)
draw_sprite_ext(spr_eyes_normal,0,x,y,1,1,image_angle,c_white,1)


