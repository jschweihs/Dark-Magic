//draw_set_alpha(.5);
//draw the player in his hit state w red
if(isHit) {
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_red, 1);
}

//alernate between grey and white for invisible
else if(isInvincible) {
    if(sin(invincTimer/2) < .5) {
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_gray, 1);
    }
    else
    {
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
    }
}
else if(isCharging) {
    if(chargeTimer > chargeTimerLimit) {
        modAmt = 8;
    }
    else {
        modAmt = 16;
    }
    
    if(chargeTimer mod modAmt < modAmt/2) {
        switch(element) {
			case "dark":
				draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_purple, 1);
				break;
			case "water":
				draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_blue, 1);
				break;
			default:
				draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_purple, 1);
				break;
	}  
    }
    else {
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
    }
}
else if(isChangingElement) {
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
	switch(element) {
		case "dark":
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_purple, elementChangeAlpha);
			break;
		case "water":
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_blue, elementChangeAlpha);
			break;
		default:
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_purple, elementChangeAlpha);
			break;
	}
}
//draw the sprite normally
else {
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
}


//use this code to draw the players hitbox in the game

/*

draw_set_alpha(.5);
draw_set_color(c_maroon);
draw_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_top,false)
draw_set_alpha(1);

*/
