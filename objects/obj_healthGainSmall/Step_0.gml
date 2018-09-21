

if(place_meeting(x,y,obj_player) and health < obj_player.maxHeath) {

	health = min(gainAmount, obj_player.maxHealth);
	instance_destroy();
    
}

