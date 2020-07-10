/// @description Get Inputs


left_key = keyboard_check(vk_left) || keyboard_check(ord("A"))
right_key = keyboard_check(vk_right) || keyboard_check(ord("D"))
up_key = keyboard_check(vk_up) || keyboard_check(ord("W"))
down_key = keyboard_check(vk_down) || keyboard_check(ord("S"))
use_key_pressed = keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_control)

shoot_key = keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left)
release_key = keyboard_check_pressed(vk_shift) || mouse_check_button_pressed(mb_right)