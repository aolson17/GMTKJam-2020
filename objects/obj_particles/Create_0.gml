


system = part_system_create()

part_system_depth( system, depth )


emitter = part_emitter_create(system)



part = part_type_create()


part_type_shape(part,pt_shape_line)

part_type_size(part,.1,.2,0,1)


grav_amount = .02

part_type_gravity(part, grav_amount, global.grav_dir)



part_type_colour3(part,c_green,c_lime,c_green)

part_type_alpha3(part,1,1,.1)

part_type_orientation(part,0,180,.0,.2,true)

part_type_life(part,500,700)




part_emitter_stream(system, emitter, part, 5)
