//scr_movePlayerHit(arg0)

curr_Xscale = image_xscale;
image_xscale = 1;

myVelo = argument[0];
jumpSpeedH = myVelo;
mySpeed = abs(myVelo);

//move the player forward 1 pixel at a time, allows him to move a height of 1 pixel up per 1 pixel forward
for(i=0; i < mySpeed; i++) {        
    if(!place_meeting(x+sign(myVelo), y, obj_wall)) { x+= sign(myVelo); }
}

image_xscale = curr_Xscale;
