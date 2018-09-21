
    //set new view position
	var view_w = camera_get_view_width(view_camera[0]);
    var view_h = camera_get_view_height(view_camera[0]);
	
	cx = min( max( obj_player.x-(viewWidth/2), 0 ), room_width - (view_w) );
    cy = min( max( obj_player.y-((viewHeight/2)+(charHeight/2)), 0 ), room_height - (view_h) );
	
    camera_set_view_pos(view_camera[0], cx, cy);
	
