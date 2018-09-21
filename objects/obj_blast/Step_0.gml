if(x > room_width) {
    instance_destroy();
}

if(sprite_index == spr_wizard_darkBlastInit and image_index > 1.5) {
    sprite_index = spr_wizard_darkBlast;
}
  
x = round(x);
y = round(y);


//enemy collision
hitEnemy = instance_place(x+hspeed,y,obj_enemy);
if(hitEnemy != noone and !hitEnemy.isDead) {
    while !place_meeting(x+image_xscale, y, obj_enemy) {
                x += image_xscale;
            }
    hitEnemy.myHealth -= damage;
    hitEnemy.isHit = true;
    instance_create(x,y,obj_blastEnd);
    instance_destroy();
    exit;
}

if(place_meeting(x+hspeed,y,obj_wall)) {
    while !place_meeting(x+image_xscale, y, obj_wall) {
                x += image_xscale;
            } 
    instance_create(x,y,obj_blastEnd);
    instance_destroy();
}


//dragon soul collision, this will likely become a parent obj for attackable objs that arent
//walls, which are invisible, or enemies
hitSoul = instance_place(x+hspeed,y,obj_dragonSoul);
if(hitSoul != noone) {
    while !place_meeting(x+image_xscale, y, obj_dragonSoul) {
                x += image_xscale;
            }
    instance_create(x,y,obj_blastEnd);
    instance_destroy();
	
	//change sprite of dragon soul object
	if(!hitSoul.isMoving) {
		with(hitSoul) {
			if (currRotation == 0) { 
				if(is30) {
					openTo30 = true;
				}
				else {
					openTo60 = true;
				}		
			}
			else if (currRotation == 30) { 
				if (is60) {
					openTo60 = true;
				}
				else {
					closeTo0 = true;
				}
			}
			else { 
				
				if(is0) {
					closeTo0 = true;
				}
				else {

					closeTo30 = true;
				}
			}
		}
	}
    exit;
}


//collide with wall
if(place_meeting(x+hspeed,y,obj_wall)) {
    while !place_meeting(x+image_xscale, y, obj_wall) {
                x += image_xscale;
            } 
    instance_create(x,y,obj_blastEnd);
    instance_destroy();
}

hitSkull = instance_place(x+hspeed,y,obj_waterSkull);
if(hitSkull != noone) {
    while !place_meeting(x+image_xscale, y, obj_waterSkull) {
        x += image_xscale;
    }
            
    with (hitSkull) {
        isHit = true;
		sprite_index = spr_waterSkullEnd;
		image_index = 0;
		
    }       
            
    instance_create(x,y,obj_blastEnd);
    instance_destroy();
}


