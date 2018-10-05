/// @description Player Input

if inputEnabled {
	leftCheck = keyboard_check(leftKey);
	leftReleased = keyboard_check_released(leftKey);
	rightCheck = keyboard_check(rightKey);
	rightReleased = keyboard_check_released(rightKey);

	duckCheck = keyboard_check(duckKey);
	duckPressed = keyboard_check_pressed(duckKey);
	duckReleased = keyboard_check_released(duckKey);

	jumpPressed = keyboard_check_pressed(jumpKey);

	jumpReleased = keyboard_check_released(jumpKey);

	leftDashPressed = keyboard_check_pressed(leftDashKey);
	rightDashPressed = keyboard_check_pressed(rightDashKey);

	attackCheck = keyboard_check(attackKey);
	attackPressed = keyboard_check_pressed(attackKey);
	attackReleased = keyboard_check_released(attackKey);

	restartPressed = keyboard_check_pressed(restartKey);
}