// wizard_stand_attack()
show_debug_message("this should show");
// Launch first attack
if(scr_anim_hit_frame(1)) {
	show_debug_message("got into test");
    scr_wizard_createBlast();
}
// End animation if there is no second attack entered
else if(scr_anim_hit_frame(3) and !enterSecondAttack) {
    //use the attack end frame
    image_index = 10;
    enterSecondAttack = false;
    enterThirdAttack = false;
}
else if(scr_anim_hit_frame(4) and enterSecondAttack and mana >= blastCost) {
    scr_wizard_createBlast();
}
else if(scr_anim_hit_frame(7) and !enterThirdAttack) {
    //don't use attack end frame for second attack
    isAttacking = false;
    enterSecondAttack = false;
    enterThirdAttack = false;
}
else if(scr_anim_hit_frame(7) and enterThirdAttack and mana >= blastCost) {
    scr_wizard_createBlast();
}
else if(scr_anim_end()) {
    attackDelayTimer = 0;
    isAttacking = false;
    enterSecondAttack = false;
    enterThirdAttack = false;
}
