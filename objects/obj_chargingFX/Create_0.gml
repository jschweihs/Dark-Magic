depth = -9999
image_speed = .2;

switch(obj_player.element) {
	case "dark":
		sprite_index = spr_wizard_chargingDarkFX;
		break;
	case "water":
		sprite_index = spr_wizard_chargingWaterFX;
		break;
	default:
		sprite_index = spr_wizard_chargingDarkFX;
		break;
}
