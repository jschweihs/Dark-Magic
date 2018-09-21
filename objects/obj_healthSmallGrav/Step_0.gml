if(!place_meeting(x,y+fallSpeed, obj_wall)) {
    if(fallSpeed < fallSpeedMAX) {
        fallSpeed += accel;
    }
    y += round(fallSpeed);
}
else {
    while(!place_meeting(x,y+1,obj_wall)) { y++; }
}

if(place_meeting(x,y,obj_player)) {
    if(health + gainAmount < obj_player.maxHealth) {
        health += gainAmount;
        instance_destroy();
    }
    else if (health < obj_player.maxHealth) {
        health = obj_player.maxHealth;
        instance_destroy();
    }
}

