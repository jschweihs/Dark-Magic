/// @description Insert description here
// You can write your code in this editor



if isClosed {
	//random chance for mouth to start opening
	if !isAnim {
		if(floor(random(100) >= 99)) {
			isAnim = true;
			image_speed = .25;
		}
	}
	//continue opening till the animation is done
	else {
		if (image_index + image_speed == image_number) {
			image_speed = 0;
			isClosed = false;
			isAnim = false;
			exit;
		}
	}
}
//if the mouth is open
else {
	//random chance for the mouth to begin closing
	if !isAnim {
		if(floor(random(200) >= 199)) {
			isAnim = true;
			image_speed = -.25;
		}
	}
	//continue closing till anim is done
	else {
		if (image_index + image_speed == 0) {
			image_speed = 0;
			isClosed = true;
			isAnim = false;
			exit;
		}
	}
}