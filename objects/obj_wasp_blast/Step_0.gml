x += image_xscale * 2;


if(flipTimer >= flipTimeLimit) {
    image_yscale = -image_yscale;
    flipTimer = 0;
}
else {
    flipTimer++;
}


if(abs(x - origX) > fadeLimit) {
    alpha-= .1;
}

if(alpha <= 0){
    instance_destroy();
}


if(place_meeting(x,y,obj_player)) {
    health -= 10;
    instance_destroy();
}

