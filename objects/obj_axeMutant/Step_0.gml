playerDistance = distance_to_object(obj_player);

//destroy enemy when health is 0
if(myHealth <= 0) {
    isDead = true;
}

//death animation
if(isDead) {
    scr_enemyDeath();
}
//normal behavior
else if(!isHit) {


    if(playerDistance > attackDistance and !atkInitiated) {

        //axeMutant walks left when in range
        if(x > obj_player.x and abs(deltaX) > 1) {
            image_xscale = -1;
            if(playerDistance < walkAlertRange and position_meeting(x-12, y+1, obj_wall)) {
                sprite_index = spr_axeMutant_walk;
                x -= 1;
            }
            else {
                sprite_index = spr_axeMutant_idle;
            }
        }
        else if(x < obj_player.x and abs(deltaX) > 1) {
            image_xscale = 1;
            if(playerDistance < walkAlertRange and position_meeting(x+12, y+1, obj_wall)) {
                sprite_index = spr_axeMutant_walk;
                x += 1;
            }
            else {
                sprite_index = spr_axeMutant_idle;
            }
        }
    
    }

    //within range of attack
    else {
        //hasnt started attacking yet, initiate attack
        if(!atkInitiated) {
            atkInitiated = true;
            isAttacking = true;
            sprite_index = spr_axeMutant_atk;
            image_index = 0;
        }
    
        if(playerDistance > 20 and !isAttacking) {
            atkInitiated = false;
        }
    }

    if(isAttacking and image_index > 9.75) {
        atkInitiated = false;
        isAttacking = false;
    }
}

//is hit
else {

    if(hitTimer < hitTimerLimit) {
        hitTimer++;
    }
    else {
        hitTimer = 0;
        isHit = false;
    }
    
}

deltaX = x - obj_player.x;

x=round(x);
y=round(y);

