/// @description Get Inputs


left_key = keyboard_check(vk_left) || keyboard_check(ord("A"))
right_key = keyboard_check(vk_right) || keyboard_check(ord("D"))
up_key = keyboard_check(vk_up) || keyboard_check(ord("W"))
down_key = keyboard_check(vk_down) || keyboard_check(ord("S"))
use_key_pressed = keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_control)

shoot_key_pressed = mouse_check_button_pressed(mb_left)
shoot_key_down = mouse_check_button(mb_left)
shoot_key_released = mouse_check_button_released(mb_left)


release_key = mouse_check_button_pressed(mb_right)

extend_key = keyboard_check(vk_space)//mouse_wheel_up()
retract_key = keyboard_check(vk_shift)//mouse_wheel_down()
