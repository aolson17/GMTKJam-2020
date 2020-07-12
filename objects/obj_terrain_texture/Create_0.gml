

surf_w = 2800
surf_h = 2200


texture = spr_platform_texture_2
border = spr_platform_border

border_size = 2

terrain_surf = surface_create(surf_w,surf_h)
border_surf = surface_create(surf_w,surf_h)
border_surf_2 = surface_create(surf_w,surf_h)


surface_x = 0
surface_y = 0


update_surf = true

update_time = 60
alarm[0] = update_time