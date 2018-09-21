/// @description Insert description here
// You can write your code in this editor



if(!place_meeting(x,y+fallSpeed, obj_wall)) {
    if(fallSpeed < fallSpeedMAX) {
        fallSpeed += accel;
    }
    y += round(fallSpeed);
}
else {
    while(!place_meeting(x,y+1,obj_wall)) { y++; }
	image_speed = 1;
}

if(place_meeting(x,y,obj_player)) {
    obj_player.element = "dark";
	obj_player.isChangingElement = true;
	obj_player.elementChangeAlpha = 1;
	instance_destroy();
}

