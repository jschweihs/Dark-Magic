/// @description Insert description here
// You can write your code in this editor

vspeed = random(2) + 5;

size = floor(random(10));

scale = floor(random(2));

if(floor(random(2)) > 0) {
	image_xscale = -1;
}


if(size < 5) {
	sprite_index = spr_RR_debris_01;
}
else if(size < 8) {
	sprite_index = spr_RR_debris_02;
}
else {
	sprite_index = spr_RR_debris_03;
}