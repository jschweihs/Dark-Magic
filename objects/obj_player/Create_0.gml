//keyboard assignment
leftKey = vk_left
rightKey = vk_right
duckKey = vk_down
jumpKey = ord("S");
attackKey = ord("A");
spAttackKey = ord("W");
abilityKey = ord("D");
leftDashKey = ord("Q");
rightDashKey = ord("E");
restartKey = ord("P");

inputEnabled = true;

//default
sprite_index = spr_wizard_stand;
depth = 0;


//damage
maxHealth = 60;
health = maxHealth;
isHit = false;
hitTimer = 0;
hitTimerLimit = 10;
isInvincible = false;
invincTimer = 0;
invincTimerLimit = 60;

//mana
maxMana = 60;
mana = maxMana;
manaRegenCounter = 0;
manaRegenLimit = 20;
isLoop = false;
jumpCounter = 1;

//skill costs
blastCost = 2;
doubleJumpCost = 4;

//spell damages
blastDamage = 1;
chargeBlastDamage = 2;
fullChargeBlastDamage = 3;

//idle
idleTimer = 0;
idleTimerLimit = 100;
idleImageSpeed = .1;

//walking
//walkSpeed = 1;          //walking rate, pixels per second
//walkImageSpeed = .2;

//running
runImageSpeed = .2;
runSpeedMAX = 2;
runSpeed = runSpeedMAX;
walkSpeed = runSpeed/2;
fullSpeedTimer = 0;
fullSpeedTimerMAX = 8;

//sliding 
isSliding = false;
slideDecel = .2;
slideSpeed = runSpeed;
rss = slideSpeed;       //rounding var
slideEnableTimer = 0;
slideEnableTimerMAX = 16;

//jump 
isInitJump = false;
isGrounded = false;
jumpSpeedH = 0;         //double between -2 and 2 (run velocity)
jsh = jumpSpeedH;       //rounding var
jumpMoveH = .1;
jumpSpeed = 0;
jumpAccel = .25;
jumpSpeedInit = -5;
jumpSpeedMAX = 5;
jumpGrace = 0;
jumpGraceMAX = 4;
landGrace = 0;
landGraceMAX = 4;
isLandGrace = false;
fallTimer = 0;
ledgeTimerMAX = 3;
ledgeTimer = 0;
isCeilGrace = false;
ceilGrace = 0;
ceilGraceMAX = 3;

//doublejump
doubleJumpTimer = 0;
doubleJumpTimeLimit = 20;
doubleJump = true;
doubleJumpAnim = false;

//landing
isLanding = false;

//duck 
isDucked = false;
duckTimer = 0;
duckTimerLimit = 9;
duckReleaseTimer = 0;
duckReleaseLimit = 60;

//attack
attackDelayLimit = 8;
attackDelayTimer = attackDelayLimit; //attack is available by default
isAttacking = false;


//standing attack
enterSecondAttack = false;
enterThirdAttack = false;

//running attack
startRunFrame = 0;
currRunFrame = 0;

//backdash
isBackDash = false;
backDashSpeedMAX = 4;
backDashDecel = .33;
backDashSpeed = backDashSpeedMAX;
backDashTimer = 0;
backDashTimerLimit = 24;

//charge attack
isCharging = false;
isFullyCharged = false;
chargeStartTimer = 0;
chargeStartTimerLimit = 60;
chargeTimer = 0;
chargeTimerLimit = 120;
chargingFX = noone;

//unlockables
unlockDoubleJump = false;

//elementalVars
element = "dark";
isChangingElement = false;
elementChangeAlpha = 0;
elementChangeAlphaDecay = .05;

//testing vars
isFloating = false;
isCollideUp = false;


//camera
camOffset = 30;
viewWidth = 320
viewHeight = 180
charHeight = 30
cx = 0;
cy = 0;