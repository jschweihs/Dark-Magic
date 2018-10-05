//health

//set color to dark red (despite hex color being blue?  wtf?)
draw_set_color($131363);
//draws background for health, based on max health
draw_rectangle(__view_get( e__VW.XView, 0 )+X+2,__view_get( e__VW.YView, 0 )+Y, __view_get( e__VW.XView, 0 )+X+obj_player.maxHealth, __view_get( e__VW.YView, 0 )+Y+2, 0);

if(health > 0){
    //set color to main red
    draw_set_color($252593);
    //draws healthbar, based on current health (var)
    draw_rectangle(__view_get( e__VW.XView, 0 )+X+2,__view_get( e__VW.YView, 0 )+Y, __view_get( e__VW.XView, 0 )+X+health, __view_get( e__VW.YView, 0 )+Y+2, 0);
}
//draws health icon in front
draw_sprite_ext(spr_healthbarFrameFront, image_index, __view_get( e__VW.XView, 0 )+X, __view_get( e__VW.YView, 0 )+Y, 1, 1, 0, c_white, 1);
//draws the health bar border
draw_sprite_ext(spr_healthbarFrameMid, image_index, __view_get( e__VW.XView, 0 )+X+2, __view_get( e__VW.YView, 0 )+Y-2, obj_player.maxHealth, 1, 0, c_white, 1);
//draws the end cap for the health bar
draw_sprite_ext(spr_healthbarFrameEnd, image_index, __view_get( e__VW.XView, 0 )+X+obj_player.maxHealth+1, __view_get( e__VW.YView, 0 )+Y-3, 1, 1, 0, c_white, 1);


//mana

//set color to dark purple
draw_set_color($331333);
//draws background for mana, based on max mana
draw_rectangle(__view_get( e__VW.XView, 0 )+X+2,__view_get( e__VW.YView, 0 )+Y+14, __view_get( e__VW.XView, 0 )+X+obj_player.maxMana, __view_get( e__VW.YView, 0 )+Y+18, 0);

if(obj_player.mana > 0){
    //set main color to purple
    draw_set_color($632563);
    //draw mana bar, based on current mana
    draw_rectangle(__view_get( e__VW.XView, 0 )+X+2,__view_get( e__VW.YView, 0 )+Y+14, __view_get( e__VW.XView, 0 )+X+obj_player.mana, __view_get( e__VW.YView, 0 )+Y+18, 0);
}
//draws mana icon in front
draw_sprite_ext(spr_manabarFrameFront, image_index, __view_get( e__VW.XView, 0 )+X, __view_get( e__VW.YView, 0 )+Y+14, 1, 1, 0, c_white, 1);
//draws the mana bar border
draw_sprite_ext(spr_healthbarFrameMid, image_index, __view_get( e__VW.XView, 0 )+X+2, __view_get( e__VW.YView, 0 )+Y+12, obj_player.maxMana, 1, 0, c_white, 1);
//draws the end cap for the mana bar
draw_sprite_ext(spr_healthbarFrameEnd, image_index, __view_get( e__VW.XView, 0 )+X+obj_player.maxMana+1, __view_get( e__VW.YView, 0 )+Y+11, 1, 1, 0, c_white, 1);

//current elemental type
draw_sprite_ext(spr_powerUpBg, image_index, __view_get( e__VW.XView, 0 )+X+76, __view_get( e__VW.YView, 0 )+Y+19, 1, 1, 0, c_white, 1);
switch(obj_player.element) {
	case "dark":
		draw_sprite_ext(spr_darkPowerIcon, image_index, __view_get( e__VW.XView, 0 )+X+76, __view_get( e__VW.YView, 0 )+Y+7, 1, 1, 0, c_white, 1);
		break;
	case "water":
		draw_sprite_ext(spr_waterPowerIcon, image_index, __view_get( e__VW.XView, 0 )+X+76, __view_get( e__VW.YView, 0 )+Y+7, 1, 1, 0, c_white, 1);
		break;
}
