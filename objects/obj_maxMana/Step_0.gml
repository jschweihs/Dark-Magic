if(place_meeting(x,y,obj_player)) {
    obj_player.maxMana += 5;
    obj_player.mana += 2;
    instance_destroy();
}

