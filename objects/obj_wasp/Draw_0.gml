//draw healthbar
draw_set_color($131363);
draw_rectangle(x-8, y-36, x+8, y-38, 0)
if(myHealth > 0)
{
    draw_set_color($252593);
    draw_rectangle(x-8, y-36, x-8+((myHealth*16)/healthMax), y-38, 0)
}

if(isDead) {
    draw_sprite_ext(sprite_index, image_index, x-1, y, image_xscale, 1, 0, c_gray, 1-deadTimer/deadTimerLimit);
}
else if(isHit){
    if(hitTimer mod 2 == 0) {
        draw_sprite_ext(sprite_index, image_index, x-1, y, image_xscale, 1, 0, c_white, 1);
        draw_sprite_ext(sprite_index, image_index, x-1, y, image_xscale, 1, 0, c_red, 1-(myHealth/healthMax));
    }
    else {
        draw_sprite_ext(sprite_index, image_index, x+1, y, image_xscale, 1, 0, c_white, 1);
        draw_sprite_ext(sprite_index, image_index, x+1, y, image_xscale, 1, 0, c_red, 1-(myHealth/healthMax));
    }
}
else {
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1, 0, c_white, 1);
}

