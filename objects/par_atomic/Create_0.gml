

enum atomic_states{
	normal,
	angry,
	attack,
}

state = atomic_states.normal

xsp = choose(-.1,-.2,.1,.2)
ysp = choose(-.1,-.2,.1,.2)


rsp = random_range(-.2,.2)

can_damage = true
damage_cooldown = 30

if place_meeting(x,y,par_solid){
	instance_destroy()
}


