//determine which direction to face
deltaX = obj_player.x-x;
deltaY = obj_player.y-y;


//custom function to base off points instead of mask
playerDistance = sqrt(sqr(deltaX) + sqr(deltaY));


if(deltaX != 0) {
    image_xscale = (deltaX)/(abs(deltaX));
}


if (playerDistance < 80) {
    if(isEmerged) {
        
        
        //attacking
        if(playerDistance < 36) {
            if(isAttacking) {
                sprite_index = spr_trickBottle_atk;
                
            }
            else {
                isAttacking = true;
                image_index = 0;
            }
        }
        //idle
        else {
            if(!isAttacking) {
                sprite_index = spr_trickBottle_idle;
            }
        }
                 
        if(isAttacking and image_index > 6.55) {
                    isAttacking = false;
                    sprite_index = spr_trickBottle_idle;
                    image_index = 0;
                }
        
        
        
    }
    else if(isEmerging) {
        if(image_index > 3.75) {
            isEmerging = false;
            isEmerged = true;
            
        }
    }
    else {
        isEmerging = true;
        isHiding = false;
        isHidden = false;
        sprite_index = spr_trickBottle_init;
        image_speed = .15;
        image_index = 0;
    }
}
//normal behavior
else {

    if(isHidden) {
        sprite_index = spr_icon_healthGainSmall;
        image_speed = .15;
    }
    else if(isHiding) {
        if(image_index < .25) {
            isHiding = false;
            isHidden = true;
        }
    }
    //start hiding
    else {
        isHiding = true;
        isEmerging = false;
        isEmerged = false;
        isAttacking = false;
        sprite_index = spr_trickBottle_init
        image_speed = -.15;
        image_index = 3.99;
    
    }
}

