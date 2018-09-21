/// @description Insert description here
// You can write your code in this editor

if(currRotation == 0) sprite_index = spr_dragonSoulGreen;
else if (currRotation == 30) sprite_index = spr_dragonSoulBlue;
else sprite_index = spr_dragonSoulRed;


//affect all associated skulls
for(var i=0; i<array_length_1d(child);i++) {
		//opening mouth
		if(openTo30) {
			if(child[i].image_angle < 30) {
				child[i].image_angle -= openRate*child[i].image_xscale;
			}
			else
				openTo30 = false;
				currRotation = 30;
		}
		
		if(openTo60) {
			if(child[i].image_angle < 60)
				child[i].image_angle -= openRate*child[i].image_xscale
			else
				openTo60 = false;
				currRotation = 60;
		}

		//closing mouth
		if(closeTo30 ) {
			if(abs(child[i].image_angle) > 30)
				child[i].image_angle += openRate*child[i].image_xscale
			else
				closeTo30 = false;
				currRotation = 30;
	
		}
		
		if(closeTo0 ) {
			if(abs(child[i].image_angle) > 0)
				child[i].image_angle += openRate*child[i].image_xscale
			else
				closeTo0 = false;
				currRotation = 0;
	
		}

		isMoving = openTo60 or openTo30 or closeTo30 or closeTo0
		
		
		if(isMoving) {
			with(obj_player) {
				inputEnabled = false;
				if(place_meeting(x,y,obj_dragonSkull)) {
					x += other.child[i].image_xscale;
				}
			}
			
			//camera shake
			shakeX = floor(random(4)-2)
			shakeY = floor(random(4)-2)
			//frankly suprised this code works.  it is probably being executed after the
			//normal camera script.  just beware!
			camera_set_view_pos(view_camera[0], obj_player.cx+shakeX, obj_player.cy+shakeY);
			
			//drop debris from the ceiling
			debrisCount = floor(random(3)-1);
			
			for(var j=0; j<debrisCount;j++;) {
				var xSpawn = floor(random(obj_player.viewWidth));
				instance_create_depth(xSpawn+camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]),-199, obj_RR_debris);
			}
			
		}
		
		else {
			obj_player.inputEnabled = true;
		}

		child[i].direction = child[i].image_angle

		//adjust mask based on opening angle
		if(child[i].direction < 30)
			child[i].mask_index = spr_dragonSkull_mask0
		else if(child[i].direction >= 30 and child[i].direction < 59)
			child[i].mask_index = spr_dragonSkull_mask30
		else
			child[i].mask_index = spr_dragonSkull_mask60
	
}