width = camera_get_view_width(view_get_camera(0))
height = camera_get_view_height(view_get_camera(0))

spd_factor = .1

mouse_factor = .2

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


target_angle = -90
angle = target_angle

view_set_camera(0,camera)

zoom_target = zoom
min_speed_zoom = 3
max_speed_zoom = 20