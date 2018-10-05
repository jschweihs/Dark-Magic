
draw_set_colour(c_red);
draw_text_transformed(__view_get( e__VW.XView, 0 )+16,__view_get( e__VW.YView, 0 )+36,string_hash_to_newline("Coords: " + string(obj_player.x) + ", " + string(obj_player.y)), .5, .5, 0);
draw_text_transformed(__view_get( e__VW.XView, 0 )+16,__view_get( e__VW.YView, 0 )+44,string_hash_to_newline("FPS: " + string(fps_real)), .5, .5, 0);
draw_text_transformed(__view_get( e__VW.XView, 0 )+16,__view_get( e__VW.YView, 0 )+52,string_hash_to_newline("isGrounded: " + string(obj_player.isGrounded)), .5, .5, 0);
draw_text_transformed(__view_get( e__VW.XView, 0 )+16,__view_get( e__VW.YView, 0 )+60,string_hash_to_newline("jumpGrace: " + string(obj_player.jumpGrace)), .5, .5, 0);
draw_text_transformed(__view_get( e__VW.XView, 0 )+16,__view_get( e__VW.YView, 0 )+68,string_hash_to_newline("landGrace: " + string(obj_player.landGrace)), .5, .5, 0);
draw_text_transformed(__view_get( e__VW.XView, 0 )+16,__view_get( e__VW.YView, 0 )+76,string_hash_to_newline("fullSpeedTimer: " + string(obj_player.fullSpeedTimer)), .5, .5, 0);
draw_text_transformed(__view_get( e__VW.XView, 0 )+16,__view_get( e__VW.YView, 0 )+88,string_hash_to_newline("imageIndex: " + string(obj_player.image_index)), .5, .5, 0);
