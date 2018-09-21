// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = 0; // obj_doubleJumpBlast
global.__objectDepths[1] = 0; // obj_dashShadow
global.__objectDepths[2] = 0; // obj_darkBlast
global.__objectDepths[3] = 0; // obj_darkBlastEnd
global.__objectDepths[4] = 0; // obj_chargeBlastFull
global.__objectDepths[5] = 0; // obj_wall
global.__objectDepths[6] = 0; // obj_chargeBlastMid
global.__objectDepths[7] = 0; // obj_wall_diag1
global.__objectDepths[8] = 0; // obj_chargingFX
global.__objectDepths[9] = 0; // obj_wall_diag4
global.__objectDepths[10] = 0; // obj_player
global.__objectDepths[11] = 0; // obj_backDashBlast
global.__objectDepths[12] = 0; // obj_solid
global.__objectDepths[13] = 0; // obj_debug
global.__objectDepths[14] = 0; // obj_ball
global.__objectDepths[15] = 0; // object29
global.__objectDepths[16] = 0; // obj_wall_diag3
global.__objectDepths[17] = 0; // obj_underwater
global.__objectDepths[18] = 0; // obj_maxHealth
global.__objectDepths[19] = 0; // obj_enemyBlast
global.__objectDepths[20] = 0; // obj_healthGainSmall
global.__objectDepths[21] = 0; // obj_maxMana
global.__objectDepths[22] = 0; // obj_axeMutant
global.__objectDepths[23] = 0; // obj_healthSmallGrav
global.__objectDepths[24] = 0; // obj_enemy
global.__objectDepths[25] = 0; // obj_boarRat
global.__objectDepths[26] = 0; // obj_wasp_blast
global.__objectDepths[27] = 0; // obj_wasp
global.__objectDepths[28] = 0; // obj_healthbar
global.__objectDepths[29] = 0; // obj_waterSkullEnd
global.__objectDepths[30] = 0; // obj_waterSkull
global.__objectDepths[31] = 0; // obj_door
global.__objectDepths[32] = 0; // obj_icon_doubleJump
global.__objectDepths[33] = 0; // obj_wall_diag2
global.__objectDepths[34] = 0; // obj_trickBottle
global.__objectDepths[35] = 0; // obj_enemyExplosionL
global.__objectDepths[36] = 0; // obj_enemyExplosionS
global.__objectDepths[37] = 0; // obj_enemyExplosionM
global.__objectDepths[38] = 0; // obj_fireDim
global.__objectDepths[39] = 0; // object42
global.__objectDepths[40] = 0; // obj_UI_ctrl
global.__objectDepths[41] = 0; // obj_birdIsland_bg_ctrl
global.__objectDepths[42] = 0; // obj_enemyExplosion
global.__objectDepths[43] = 0; // obj_crystalCaverns_bg_ctrl
global.__objectDepths[44] = 0; // obj_enemySpawn


global.__objectNames[0] = "obj_doubleJumpBlast";
global.__objectNames[1] = "obj_dashShadow";
global.__objectNames[2] = "obj_darkBlast";
global.__objectNames[3] = "obj_darkBlastEnd";
global.__objectNames[4] = "obj_chargeBlastFull";
global.__objectNames[5] = "obj_wall";
global.__objectNames[6] = "obj_chargeBlastMid";
global.__objectNames[7] = "obj_wall_diag1";
global.__objectNames[8] = "obj_chargingFX";
global.__objectNames[9] = "obj_wall_diag4";
global.__objectNames[10] = "obj_player";
global.__objectNames[11] = "obj_backDashBlast";
global.__objectNames[12] = "obj_solid";
global.__objectNames[13] = "obj_debug";
global.__objectNames[14] = "obj_ball";
global.__objectNames[15] = "object29";
global.__objectNames[16] = "obj_wall_diag3";
global.__objectNames[17] = "obj_underwater";
global.__objectNames[18] = "obj_maxHealth";
global.__objectNames[19] = "obj_enemyBlast";
global.__objectNames[20] = "obj_healthGainSmall";
global.__objectNames[21] = "obj_maxMana";
global.__objectNames[22] = "obj_axeMutant";
global.__objectNames[23] = "obj_healthSmallGrav";
global.__objectNames[24] = "obj_enemy";
global.__objectNames[25] = "obj_boarRat";
global.__objectNames[26] = "obj_wasp_blast";
global.__objectNames[27] = "obj_wasp";
global.__objectNames[28] = "obj_healthbar";
global.__objectNames[29] = "obj_waterSkullEnd";
global.__objectNames[30] = "obj_waterSkull";
global.__objectNames[31] = "obj_door";
global.__objectNames[32] = "obj_icon_doubleJump";
global.__objectNames[33] = "obj_wall_diag2";
global.__objectNames[34] = "obj_trickBottle";
global.__objectNames[35] = "obj_enemyExplosionL";
global.__objectNames[36] = "obj_enemyExplosionS";
global.__objectNames[37] = "obj_enemyExplosionM";
global.__objectNames[38] = "obj_fireDim";
global.__objectNames[39] = "object42";
global.__objectNames[40] = "obj_UI_ctrl";
global.__objectNames[41] = "obj_birdIsland_bg_ctrl";
global.__objectNames[42] = "obj_enemyExplosion";
global.__objectNames[43] = "obj_crystalCaverns_bg_ctrl";
global.__objectNames[44] = "obj_enemySpawn";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
    var objID = asset_get_index( global.__objectNames[i] );
    if (objID >= 0) {
        global.__objectID2Depth[ objID ] = global.__objectDepths[i];
    } // end if
} // end for