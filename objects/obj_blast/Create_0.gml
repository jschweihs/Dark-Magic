switch(obj_player.element) {
	case "dark":
		sprite_index = spr_wizard_darkBlast;
		break;
	case "water":
		sprite_index = spr_wizard_waterBlast;
		break;
	default:
		sprite_index = spr_wizard_darkBlast;
		break;
}

damage = obj_player.blastDamage;

depth = -100;
image_speed = .5;
hspeed = 5 * obj_player.image_xscale;

image_xscale = obj_player.image_xscale;

if(obj_player.isDucked) {
    y += 10;
}

blastCounter = 0;

