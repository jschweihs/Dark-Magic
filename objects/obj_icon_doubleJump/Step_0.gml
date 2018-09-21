if(place_meeting(x,y,obj_player)) {
    obj_player.unlockDoubleJump = true;
    instance_destroy();
}

//equation for floating movement
y += sin(floatingTimer/10)*.75;

if(floatingTimer < 360*pi)
    floatingTimer++;
else
    floatingTimer = 0;

