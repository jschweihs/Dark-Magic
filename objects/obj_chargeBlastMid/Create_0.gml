switch(obj_player.element) {
	case "dark":
		sprite_index = spr_wizard_chargeDarkBlastMid;
		break;
	case "water":
		sprite_index = spr_wizard_chargeWaterBlastMid;
		break;
	default:
		sprite_index = spr_wizard_chargeDarkBlastMid;
		break;
}

damage = obj_player.chargeBlastDamage;

depth = -100;
image_speed = .5;
hspeed = 5 * obj_player.image_xscale;

image_xscale = obj_player.image_xscale;

if(obj_player.isDucked) {
    y += 10;
}

blastCounter = 0;