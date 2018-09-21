if(isHit) {
    
	if(sprite_index + image_speed > image_number) {
		instance_destroy();
	}
	instance_create(x,y,contents);    
}

