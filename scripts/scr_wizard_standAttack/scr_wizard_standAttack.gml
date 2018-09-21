if(image_index >= 1 and image_index < 1.1) {
    scr_wizard_createBlast();
}
else if(image_index > 3.75 and image_index < 4 and !enterSecondAttack) {
    //use the attack end frame
    image_index = 10;
}
else if(enterSecondAttack and image_index >= 4 and image_index < 4.1 and mana >= blastCost) {
    scr_wizard_createBlast();
}
else if(image_index > 6.75 and image_index < 7 and !enterThirdAttack) {
    //don't use attack end frame for second attack
    isAttacking = false;
    enterSecondAttack = false;
    enterThirdAttack = false;
}
else if(enterThirdAttack and image_index >= 7 and image_index < 7.1 and mana >= blastCost) {
    scr_wizard_createBlast();
}
else if(image_index > 10.75) {
    attackDelayTimer = 0;
    isAttacking = false;
    enterSecondAttack = false;
    enterThirdAttack = false;
}
