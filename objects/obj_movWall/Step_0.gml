/// @description Insert description here
// You can write your code in this editor



if(!isResting) {
	if(horizEnabled) {
		if(forwardX) {
			if(x<maxX) {
				x += moveX;
			}
			else {
				isResting = true;
			}
		}
		else {
			if(x>minX) {
				x -= moveX;
			}
			else {
				isResting = true;
			}
		}
	}
	if(vertEnabled) {
		if(forwardY) {
			if(y<maxY) {
				y += moveY;
			}
			else {
				isResting = true;
			}
		}
		else {
			if(y>minY) {
				y -= moveY;
			}
			else {
				isResting = true;
			}
		}
	}
}
else {
	if(restTimer < restTimerMAX) {restTimer++;}
	else {
		restTimer = 0;
		isResting = false;
		forwardX = !forwardX;
		forwardY = !forwardY;
	}
}