//scr_wizard_walk(direction, stairs1, stairs2)

moveSpeed = argument[0];
isStairs1 = argument[1];
isStairs2 = argument[2];

jumpSpeedH = moveSpeed;
//on left stairs
if(isStairsLeft) {
    //getting off left stairs
    if(!place_meeting(x,y+moveSpeed,obj_wall_diag1)) {
        isStairsLeft = false;
        x-= moveSpeed;
    }
    //moving on left stairs
    else {
        x -= moveSpeed;
        y += moveSpeed;
    }
    //exit;
}
//on right stairs
else if(isStairsRight) {
    //getting off right stairs
    if(!place_meeting(x-walkSpeed,y,obj_wall_diag2)) {
        isStairsRight = false;
        x-= walkSpeed;
    }
    //moving on right stairs
    else {
        x -= moveSpeed;
        y -= moveSpeed;
    }
    //exit;
}
                
//not on stairs and space in free is available
else if(!place_meeting(x-walkSpeed,y,obj_wall)) { 
    jumpSpeedH = -moveSpeed;
    //walk
    x -= moveSpeed;
                    
    if(place_meeting(x-moveSpeed,y,obj_wall_diag1)) {
        isStairsLeft = true;
        y-=moveSpeed;
    }
    else if(place_meeting(x-1,y,obj_wall_diag2)) {
        isStairsRight = true;
    }
}
