//scr_wizard_createDarkBlast()
//Descriptions: Creates the projectile for a basic attack

//checks for open position in front of the wizard
if(position_empty(x+(30*image_xscale), y-20) and mana >= darkBlastCost) {
    //resets attack delay timer
    attackDelayTimer = 0;
    //creates the projectile object
    instance_create(x + (30*image_xscale),y-20,obj_chargeBlastMid);
    //takes away mana
    mana -= darkBlastCost;
}
