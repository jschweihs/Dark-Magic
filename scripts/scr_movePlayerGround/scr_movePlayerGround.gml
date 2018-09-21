//scr_movePlayerGround(arg0)
myVelo = argument[0];

//hack for collision detection
curr_Xscale = image_xscale;
image_xscale = 1;

//build up momentum before running full speed
if(fullSpeedTimer < fullSpeedTimerMAX) {
	myVelo /= 2;
}

//let player directly off ledge if inching towards it
if(ledgeTimer == ledgeTimerMAX) {
	jumpSpeedH = myVelo;
}
else {
	jumpSpeedH = 0;
}


mySpeed = abs(myVelo);

//move the player forward 1 pixel at a time, allows him to move a height of 1 pixel up per 1 pixel forward
for(i=0; i < mySpeed; i++) {        
    if(!place_meeting(x+sign(myVelo), y, obj_wall) and !place_meeting(x+sign(myVelo), y+1, obj_wall)) { x += sign(myVelo); y += 1;}
    else if(place_meeting(x+sign(myVelo), y, obj_wall) and !place_meeting(x+sign(myVelo), y-1, obj_wall)) { x += sign(myVelo); y -= 1;}
    else if(!place_meeting(x+sign(myVelo), y, obj_wall)) { x+= sign(myVelo); }
}

//end the hack
image_xscale = curr_Xscale;
