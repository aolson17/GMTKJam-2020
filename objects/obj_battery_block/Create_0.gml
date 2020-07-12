

var radius = 80
var battery_amount = 12

for (var i = 0; i < battery_amount; i++){
	instance_create_layer(x+lengthdir_x(radius,360*(i/battery_amount)),y+lengthdir_y(radius,360*(i/battery_amount)),"Instances",obj_battery)
}



