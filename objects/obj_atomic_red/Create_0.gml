

enum atomic_states{
	normal,
	angry,
	attack,
}

state = atomic_states.normal

xsp = choose(-.1,-.2,.1,.2)
ysp = choose(-.1,-.2,.1,.2)


rsp = random_range(-.2,.2)

eye_sprite = spr_atomic_red_eyes

anger_range = 150




angry_frames = 110

can_damage = true
damage_cooldown = 30

//attack_frames = 40
attack_range = sprite_get_width(spr_flash_2)/2
