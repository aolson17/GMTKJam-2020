width = camera_get_view_width(view_get_camera(0))
height = camera_get_view_height(view_get_camera(0))

spd_factor = .08

target = obj_player

shake_offset_x = 0
shake_offset_y = 0

zoom = 1
zoom_width = width
zoom_height = height

x = target.x
y = target.y
target_x = x
target_y = y

shake = 0
camera = camera_create_view(x,y,width,height)

view_set_camera(0,camera)