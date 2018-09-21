switch(obj_player.element) {
	case "dark":
		sprite_index = spr_wizard_chargeDarkBlastFull;
		break;
	case "water":
		sprite_index = spr_wizard_chargeWaterBlastFull;
		break;
	default:
		sprite_index = spr_wizard_chargeDarkBlastFull;
		break;
}

damage = obj_player.fullChargeBlastDamage;

depth = -100;
image_speed = .5;
hspeed = 5 * obj_player.image_xscale;

image_xscale = obj_player.image_xscale;

if(obj_player.isDucked) {
    y += 10;
}

blastCounter = 0;