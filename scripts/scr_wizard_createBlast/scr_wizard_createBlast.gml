//scr_wizard_createDarkBlast()
//Descriptions: Creates the projectile for a basic attack

//checks for open position in front of the wizard

//resets attack delay timer
attackDelayTimer = 0;

//fully charged blast
if(isFullyCharged) {
    //if(position_empty(x+(30*image_xscale), y-20) and mana >= darkBlastCost) {
        instance_create(x + (30*image_xscale),y-20,obj_chargeBlastFull);
    //}
    isFullyCharged = false;
    isCharging = false;
}

//mid level charge blast
else if(isCharging) {
    //if(position_empty(x+(30*image_xscale), y-20) and mana >= darkBlastCost) {
        instance_create(x + (30*image_xscale),y-20,obj_chargeBlastMid);
    //}
    isCharging = false;
}

//normal blast
else {
    //if(position_empty(x+(30*image_xscale), y-20) and mana >= darkBlastCost) {
        instance_create(x + (30*image_xscale),y-20,obj_blast);
    //}
    mana -= blastCost;
}
    //takes away mana
