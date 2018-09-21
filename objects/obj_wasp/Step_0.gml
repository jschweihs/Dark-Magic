//destroy enemy when health is 0
if(myHealth <= 0) {
    isDead = true;
}

if(isDead) {
    scr_enemyDeath();
}
//regular movement
else if(!isHit) {
    if(!isAttacking) {
        //horizontal movement plan
        if(pathHorizontal) {
            if(stepCount >= stepLimit) {
                stepCount = 0;
                image_xscale *= -1;
            }
            else {
                x += image_xscale;
                stepCount++;
            }
        }
    
        //vertical movement plan
        else {
            if(stepCount >= stepLimit) {
                stepCount = 0;
                vertDirection *= -1;
            }
            else {
                y += vertDirection;
                stepCount++;
            }
    
            if(obj_player.x < x) {
                image_xscale = -1;
            }
            else {
                image_xscale = 1;
            }
        }
    
        //attacking trigger
        if(attackEligable and (distance_to_object(obj_player) < 70) and (abs(y-(obj_player.y-16)) < 8) and sign(image_xscale) == sign(obj_player.x-x)) {
            isAttacking = true;
            attackEligable = false;
            sprite_index = spr_wasp_atk;
                image_index = 0;
        
        }
    }
    else {
        if(image_index >= 3.75) {
            instance_create(x + (6*image_xscale),y-1,obj_wasp_blast);
            isAttacking = false;
            sprite_index = spr_wasp_idle;
        }
    }
    if(attackTimer >= attackTimeLimit ) {
        attackEligable = true;
        attackTimer = 0;
    }
    else if (!attackEligable) {
        attackTimer++;
    }
}

//hit
else {
        if(hitTimer < hitTimerLimit) {
            hitTimer++;
        }
        else {
            hitTimer = 0;
            isHit = false;
        }
    }

//stop and attack
/*
if(!attackEligable) {
    attackTimer++;
    if(attackTimer >= attackTimeLimit) {
        attackTimer = 0;
        isAttacking = false;
        sprite_index = spr_wasp_idle;
    }
}
else {

}
*/




/* */
/*  */
