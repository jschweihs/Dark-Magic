// Main player logic

#region not hit
if (!isHit) {

    #region AIR
    if (!isGrounded) {

        // Determine sprite while in air
        if (!isAttacking) {
            // DoubleJump takes priority
            if (!doubleJumpAnim) {
                if (jumpSpeed < jumpSpeedInit + 1) {
                    sprite_index = spr_wizard_jumpInit;
                } else if (jumpSpeed < -1) {
                    sprite_index = spr_wizard_jumpUp;
                } else if (jumpSpeed < 0) {
                    sprite_index = spr_wizard_jumpTop;
                } else if (jumpSpeed < jumpSpeedMAX / 2) {
                    sprite_index = spr_wizard_jumpDown;
                    image_speed = 0;
                } else {
                    sprite_index = spr_wizard_jumpDown;
                    image_speed = runImageSpeed;
                }
            } else {
                if (image_index > 1.7) {
                    doubleJumpAnim = false;
                }
            }
        }
        // Attacking animation
        else {
            scr_wizard_attack();
        }

        // Problem: GM has a bug when detecting collissions with image_xscale at -1
        // and a precise collision mask on the obj_wall_diag2 object
        // Solution:  Temporarily put the image scale back to 1, do the math, and turn back.
        curr_xScale = image_xscale;
        image_xscale = 1;

        // Collide with wall above        
        if (jumpSpeed <= 0 and place_meeting(x, y + jumpSpeed, obj_wall)) {
            // Continue moving towards the ceiling until touching
            while (!place_meeting(x, y - 1, obj_wall)) {
                y -= 1;
            }
            // Set state for playing to fall
            jumpSpeed = 0;
            isCeilGrace = true;
            ceilGrace = 0;

        }

        // Glide along ceiling grace period
        if (ceilGrace < ceilGraceMAX) {
            ceilGrace++;
        } else {
            ceilGrace = 0;
            isCeilGrace = false;
        }

        // Boost into specific 2 tile tall areas
        if (place_meeting(x + curr_xScale, y, obj_wall)) {
            // Check an opening in the wall for each pixel for the current jump speed
            // Start with i=1 because we already know that the wall is present for i=0
            // The +2 is because the character bounding box is 2 pixels short of 2 tiles (30 vs 32)
            var absJump = max(2, abs(jumpSpeed) + 2);
            for (var i = 1; i < absJump; i++;) {
                // Checking if the place is open and if the player is giving input in that direction
                if (!place_meeting(x + curr_xScale, y + (i * sign(jumpSpeed)), obj_wall) and place_meeting(x + curr_xScale, y + sign(jumpSpeed) + (i * sign(jumpSpeed)), obj_wall) and((curr_xScale == -1 and leftCheck) or(curr_xScale == 1 and rightCheck))) {

                    // Move the player into the opening and land him
                    x += curr_xScale;
                    y += i * sign(jumpSpeed);
                    while !place_meeting(x, y + 1, obj_wall) {
                        y += 1;
                    }
                    // Set the state to grounded
                    isGrounded = true;
                    enterSecondAttack = false;
                    enterThirdAttack = false;
                    doubleJump = true;
                    doubleJumpTimer = 0;
                    jumpSpeed = 0;
                    jumpSpeedH = 0;
                    idleTimer = 0;
                    if (duckCheck) {
                        isDucked = true;
                        duckTimer = 0
                        image_index = 0;
                        image_speed = .2;
                    }
                }
            }
        }


        // Land the character if ground is below
        if (!isGrounded and place_meeting(x, y + jumpSpeed, obj_wall)) {

            // Set the player state to grounded and cancel attacks
            isGrounded = true;
            enterSecondAttack = false;
            enterThirdAttack = false;

            // Move the player the remaining distance to the edge of the wall
            jsh = round(jumpSpeedH);
            if (place_meeting(x + jsh, y, obj_wall)) {
                jumpSpeedH = 0;
                while (!place_meeting(x + sign(jsh), y, obj_wall)) {
                    x += sign(jsh);
                }
            } else {
                x += jsh;
            }

            // Landing the character the remaining distance to the ground
            while !place_meeting(x, y + 1, obj_wall) {
                y += 1;
            }

            // Hack to continue fluid movement when landing on upward slopes
            // Without these 'pushes', the player freezes for a single frame
            if (leftCheck and place_meeting(x + curr_xScale, y, obj_wall_diag2)) {
                x--;
                y--;
            } else if (rightCheck and place_meeting(x + curr_xScale, y, obj_wall_diag1)) {
                x++;
                y--;
            }

            // Determine if landing state should applied (transition animation)
            // Jump is at near max speed downwards, is not in the middle of an attack combo, and is not wanting to move
            if (jumpSpeed > jumpSpeedMAX - 1 and!isAttacking and!(leftCheck or rightCheck or duckCheck)) {
                isLanding = true;
                sprite_index = spr_wizard_jumpLand;
                image_index = 0;
                image_speed = .2;
            } else if (duckCheck) {
                isDucked = true;
                duckTimer = 0
                image_index = 0;
                image_speed = .2;
            }
            // Set state for landing
            doubleJump = true;
            doubleJumpTimer = 0;
            jumpSpeed = 0;
            idleTimer = 0;
            jumpGrace = 0;

            // Execute another jump if the player hit jump again in the grace period
            if (isLandGrace and landGrace < landGraceMAX) {
                scr_wizard_groundJump();
            } else {
                jumpSpeedH = 0;
            }

        }

        // Continue falling
        if (!isGrounded and!isCeilGrace) {
            // Increase drop speed until it reaches maximum
            if (jumpSpeed < jumpSpeedMAX) {
                jumpSpeed += jumpAccel;
            } else {
                jumpSpeed = jumpSpeedMAX;
            }
            y += floor(jumpSpeed);
        }

        // Move horizontal
        jsh = round(jumpSpeedH);
        if (place_meeting(x + jsh, y, obj_wall)) {
            jumpSpeedH = 0;
            // Move the player the remaining distance to the edge of the wall
            while (!place_meeting(x + sign(jsh), y, obj_wall)) {
                x += sign(jsh);
            }
        } else {
            x += jsh;
        }

        ledgeTimer = 0;

        // Increment doublejump timer
        if (doubleJumpTimer < doubleJumpTimeLimit) {
            doubleJumpTimer++;
        }

        // Set x-scale back to normal, used for hack described above
        image_xscale = curr_xScale;

        //CONTROLS 
        // Left and right
        if (!place_meeting(x + jsh, y, obj_wall) and leftCheck and!rightCheck and jumpSpeedH > -walkSpeed) {
            jumpSpeedH -= jumpMoveH;
        }
        if (!place_meeting(x + jsh, y, obj_wall) and rightCheck and!leftCheck and jumpSpeedH < walkSpeed) {
            jumpSpeedH += jumpMoveH;
        }

        // Jump grace period timer
        if (!isGrounded and jumpGrace < jumpGraceMAX) {
            jumpGrace++;
        } else if (isLandGrace and landGrace < landGraceMAX) {
            landGrace++;
        }

        // Jump grace
        if (jumpPressed and jumpGrace < jumpGraceMAX) {
            scr_wizard_groundJump();
        }

        // Doublejump
        else if (unlockDoubleJump and jumpPressed and doubleJumpTimer >= doubleJumpTimeLimit and doubleJump and!isAttacking and mana >= doubleJumpCost) {
            mana -= doubleJumpCost;
            jumpSpeed = jumpSpeedInit;
            doubleJump = false;
            doubleJumpAnim = true;
            image_speed = .2;
            image_index = 0;
            //SPRITE CHANGE double jump
            sprite_index = spr_wizard_doubleJump;
            instance_create(x - (6 * image_xscale), y - 1, obj_doubleJumpBlast);
        }

        // Pre landing jump grace
        else if (jumpPressed) {
            landGrace = 0;
            isLandGrace = true;
        }

        // Control jump height by releasing space bar
        if (jumpSpeed < 0 and jumpReleased) {
            jumpSpeed = -1;
            doubleJumpTimer = doubleJumpTimeLimit;
        }
    }
	#endregion

    #region GROUND
    else {

        // Detecting ground beneath (walking off ledges etc)

        // Problem: GM has a bug when detecting collissions with image_xscale at -1
        // and a precise collision mask on the obj_wall_diag2 object
        // Solution:  Temporarily put the image scale back to 1, do the math, and turn back.
        curr_xScale = image_xscale;
        image_xscale = 1;

        // Player has moved into a spot without ground below
        if (!place_meeting(x, y + 1, obj_wall)) {
            // If the player is moving on a downward slope
            if (place_meeting(x, y + 2, obj_wall_diag1) or place_meeting(x, y + 2, obj_wall_diag2)) {
                y += 1;
            }
            // If the player is to start falling
            else {
                isGrounded = false;
                //isLanding = false;
                isBackDash = false;
                backDashTimer = 0;
                backDashSpeed = backDashSpeedMAX;
                isSliding = false;
                isAttacking = false;
                doubleJumpTimer = 0;
                sprite_index = spr_wizard_jumpTop;
                jumpGrace = 0;
            }
        }

        image_xscale = curr_xScale; // End of hack

        // Backdash
        if (isBackDash) {

            scr_movePlayerGround(-backDashSpeed * image_xscale);

            if (sprite_index = spr_wizard_backDashInit and(image_index + image_speed) >= sprite_get_number(sprite_index)) {
                sprite_index = spr_wizard_backDash;
            }
            if (backDashTimer < backDashTimerLimit) {
                backDashTimer++;
                if (backDashTimer > 2 * backDashTimerLimit / 3) {
                    backDashSpeed -= backDashDecel;
                    sprite_index = spr_wizard_backDashEnd;
                    image_speed = .18;
                }
                if (backDashTimer mod 5 = 0) {
                    instance_create(x, y, obj_dashShadow);
                }
            } else {
                isBackDash = false;
                backDashTimer = 0;
                backDashSpeed = backDashSpeedMAX;
            }
        }

        // No movement left, right, or down (or both left and right at the same time)
        else if (!(leftCheck or rightCheck or duckCheck) or(leftCheck and rightCheck) or!inputEnabled) {

            // Next jump will be straight up unless more movement is entered
            jumpSpeedH = 0;
            ledgeTimer = 0;

            // Time to reach full speed falls off gradually
            if (fullSpeedTimer > 0) {
                fullSpeedTimer--;
            }
            if (slideEnableTimer < slideEnableTimerMAX) {
                slideEnableTimer = 0;
            }

            // Player is not attacking
            if (!isAttacking) {

                // Sliding animation out of a run
                if (isSliding) {

                    sprite_index = spr_wizard_slide;
                    image_speed = .25;

                    if (abs(slideSpeed) > slideDecel) slideSpeed -= slideDecel * sign(slideSpeed);

                    scr_movePlayerGround(slideSpeed);

                    if (image_index > 2.70 or place_meeting(x + (rss * image_xscale), y, obj_wall)) {
                        isSliding = false;
                        slideEnableTimer = 0;
                        slideSpeed = runSpeed;
                    }
                }

                // Not landing
                else if (!isLanding) {
                    // Idle
                    if (idleTimer > idleTimerLimit) {
                        //SPRITE CHANGE idle
                        sprite_index = spr_wizard_idle;
                        image_speed = idleImageSpeed;
                    } else {
                        // Increment idle timer and continue with standing sprite
                        idleTimer++;
                        sprite_index = spr_wizard_stand;
                    }
                }
                // Landing animation
                else {
                    sprite_index = spr_wizard_jumpLand;
                    if (image_index > 1.75) {
                        isLanding = false;
                    }
                }
            }
            // Standing attacking animation
            else {
                scr_wizard_attack();
            }
        }

        //CONTROLS
        // Jump
        if (jumpPressed & !(place_meeting(x, y + jumpSpeedInit, obj_wall)) and!isBackDash) {
            scr_wizard_groundJump();
        }

        // Backdesh
        if (!isBackDash and((leftDashPressed and image_xscale = 1) or(rightDashPressed and image_xscale = -1))) {
            isBackDash = true;
            isSliding = false;
            isAttacking = false;
            enterSecondAttack = false;
            enterThirdAttack = false;
            sprite_index = spr_wizard_backDashInit;
            image_index = 0;
            image_speed = .2;

            instance_create(x, y, obj_backDashBlast);
        } else if ((leftDashPressed and image_xscale = -1) or(rightDashPressed and image_xscale = 1)) {
            // Forward dash coming soon!
        }

        // Down Key: Duck
        if (duckPressed and!isAttacking) {
            isDucked = true;
            isLanding = false;
            isSliding = false;
            enterSecondAttack = false;
            enterThirdAttack = false;
            image_index = 0;
            image_speed = .2;

        }

        // Staying ducked
        if (duckCheck and!isBackDash) {
            isDucked = true;
            isLanding = false;
            isSliding = false;
            enterSecondAttack = false;
            enterThirdAttack = false;
            image_speed = .2;
            // Attacking while ducking
            if (isAttacking) {
                // Create blast on attacking frame
                if (image_index >= 1 and image_index < 1.1) {
                    scr_wizard_createBlast();
                }
                // End attack animation
                else if (image_index > 2.75 and image_index <= 3) {
                    isAttacking = false;
                }
            }

            // SPRITE CHANGING duck animations
            // Ducking idle,  intro animation and holding the main duck frame
            else {
                if (duckTimer < duckTimerLimit) {
                    duckTimer++;
                    sprite_index = spr_wizard_duckInit;
                } else {
                    sprite_index = spr_wizard_duck;
                    image_index = 0;
                }
            }

        }
        // Duck release 
        if (duckReleased) {
            sprite_index = spr_wizard_duckRel;
            duckTimer = 0;
            idleTimer = 0;
            isAttacking = false;
            isDucked = false;
        }


        // Move left
        if (inputEnabled and leftCheck and!rightCheck and!duckCheck and!isBackDash) {

            // GM HACK, GETS SET BACK TO -1 BEFORE THE END
            if (!isAttacking) {
                image_xscale = -1;
            }
            // Cancel any previous sliding in motion      
            isSliding = false;

            // Running
            scr_movePlayerGround(-runSpeed);

            // Running attack animation
            if (isAttacking) {
                if (image_index > currRunFrame + .75 and image_index < currRunFrame + 1) {
                    sprite_index = spr_wizard_runAtk_pt2;
                    image_index = floor(currRunFrame + 1);
                    scr_wizard_createBlast();
                } else if (image_index > currRunFrame + 1.75 and image_index < currRunFrame + 2) {
                    sprite_index = spr_wizard_runAtk_pt3;
                    image_index = floor(currRunFrame + 2);
                } else if (image_index > currRunFrame + 2.75) {
                    isAttacking = false;
                    attackDelayTimer = 0;
                    sprite_index = spr_wizard_run;
                    if (image_index > 7) {
                        image_index -= 7;
                    }
                }
            }
            // Normal run animation
            else {
                sprite_index = spr_wizard_run;
                image_speed = runImageSpeed;
            }

            // Timer for falling or running off ledges
            if (isGrounded and ledgeTimer < ledgeTimerMAX) {
                ledgeTimer++;
            }

            // Full speed timer increment
            if (fullSpeedTimer < fullSpeedTimerMAX) {
                fullSpeedTimer++;
            }
            isDucked = false;
            isLanding = false;
            idleTimer = 0;
            slideEnableTimer++;
            enterSecondAttack = false;
            enterThirdAttack = false;
        }



        // Move right
        else if (inputEnabled and rightCheck and!leftCheck and!duckCheck and!isBackDash) {

            if (!isAttacking) {
                image_xscale = 1;
            }
            isSliding = false;

            scr_movePlayerGround(runSpeed);

            // Running and attacking
            if (isAttacking) {
                if (image_index > currRunFrame + .75 and image_index < currRunFrame + 1) {
                    sprite_index = spr_wizard_runAtk_pt2;
                    image_index = floor(currRunFrame + 1);
                    scr_wizard_createBlast();
                } else if (image_index > currRunFrame + 1.75 and image_index < currRunFrame + 2) {
                    sprite_index = spr_wizard_runAtk_pt3;
                    image_index = floor(currRunFrame + 2);
                } else if (image_index > currRunFrame + 2.75) {
                    isAttacking = false;
                    attackDelayTimer = 0;
                    sprite_index = spr_wizard_run;
                    if (image_index > 7) {
                        image_index -= 7;
                    }

                }
            }
            // Normal run animation
            else {
                sprite_index = spr_wizard_run;
                image_speed = runImageSpeed;
            }

            // Timer for falling or running off ledges
            if (isGrounded and ledgeTimer < ledgeTimerMAX) {
                ledgeTimer++;
            }
            // Full speed timer increment
            if (fullSpeedTimer < fullSpeedTimerMAX) {
                fullSpeedTimer++;
            }
            isDucked = false;
            isLanding = false;
            idleTimer = 0;
            slideEnableTimer++;
            enterSecondAttack = false;
            enterThirdAttack = false;
        }

        // Enable sliding on key release
        if (leftReleased and!rightCheck and!duckCheck and!place_meeting(x - runSpeed, y, obj_wall) and slideEnableTimer > slideEnableTimerMAX) {
            isSliding = true;
            slideSpeed = -runSpeed;
            isLanding = false;
            isAttacking = false;
        } else if (rightReleased and!leftReleased and!duckCheck and!place_meeting(x + runSpeed, y, obj_wall) and slideEnableTimer > slideEnableTimerMAX) {
            isSliding = true;
            slideSpeed = runSpeed;
            isLanding = false;
            isAttacking = false;
        }
    }
	#endregion
	
    // Code that executes regardless of jump condition

    // Mana regen
    if (manaRegenCounter < manaRegenLimit) {
        manaRegenCounter++;
    } else {
        if (mana < maxMana and(!isCharging or isFullyCharged)) {
            mana++;
        }
        manaRegenCounter = 0;
    }

    // Getting hit 
    hitEnemy = instance_place(x, y, obj_enemy);
    if (!isInvincible and(place_meeting(x, y, obj_enemy) or place_meeting(x, y, obj_enemyBlast)) and hitEnemy != noone and hitEnemy.isDead == false) {
        isHit = true;
        isInvincible = true;
        isAttacking = false;
        isLanding = false;
        isSliding = false;
        isBackDash = false;
        backDashTimer = 0;
        backDashSpeed = backDashSpeedMAX;
        enterSecondAttack = false;
        enterThirdAttack = false;
        idleTimer = 0;
        jumpSpeedH = 0;
        jumpSpeed = 0;
    }

    //CONTROLS

    // Attack
    if (inputEnabled and attackPressed and!isAttacking and!isBackDash and attackDelayTimer >= attackDelayLimit and mana >= blastCost) {
        idleTimer = 0;
        chargeStartTimer = 0;
        chargeTimer = 0;
        image_speed = .2
        // Standing, walking, jumping, or ducking

        if (isDucked) {
            sprite_index = spr_wizard_duckAtk;
            image_index = 0;
            image_speed = .2;
        } else if (isGrounded and(leftCheck or rightCheck)) {
            currRunFrame = floor(image_index);
            sprite_index = spr_wizard_runAtk_pt1;
            image_index = currRunFrame;
            image_speed = .2
        } else {
            sprite_index = spr_wizard_standAtk;
            image_index = 0;
            image_speed = .2;
        }
        isAttacking = true;
        isSliding = false;
        isLanding = false;
    }
    // Queue up second attack
    else if (inputEnabled and attackPressed and!(isGrounded and(leftCheck or rightCheck)) and!isDucked and isAttacking and!isBackDash and!enterSecondAttack and!enterThirdAttack and mana >= blastCost) {
        enterSecondAttack = true;
    }
    // Queue up third attack
    else if (inputEnabled and attackPressed and!(isGrounded and(leftCheck or rightCheck)) and!isDucked and isAttacking and!isBackDash and!enterThirdAttack and mana >= blastCost) {
        enterThirdAttack = true;
    }

    // Charging up blast
    if (inputEnabled and attackCheck) {

        if (chargeStartTimer < chargeStartTimerLimit) {
            chargeStartTimer++;
        } else {
            if (!instance_exists(obj_chargingFX)) {
                chargingFX = instance_create(x + 2, y - 16, obj_chargingFX);
            }
            isCharging = true;
            chargeTimer++;
            // Fully charged
            if (chargeTimer > chargeTimerLimit) {
                isFullyCharged = true;
            }
            // Not fully charged yet
            else if (chargeTimer mod 8 == 0) {
                mana -= 1;
            }
        }
    }
    // Releasing charge blast
    if (attackReleased) {
        // Remove charging animation
        if (isCharging) {
            with(chargingFX) instance_destroy();

            if (!isBackDash) {
                isAttacking = true;
                isSliding = false;
                isLanding = false;


                if (isDucked) {
                    sprite_index = spr_wizard_duckAtk;
                    image_index = 0;
                    image_speed = .2;
                } else if (isGrounded and(leftCheck or rightCheck)) {
                    currRunFrame = floor(image_index);
                    sprite_index = spr_wizard_runAtk_pt1;
                    image_index = currRunFrame;
                    image_speed = .2
                } else {
                    sprite_index = spr_wizard_standAtk;
                    image_index = 0;
                    image_speed = .2;
                }
            } else {
                scr_wizard_createBlast();
            }

            chargeStartTimer = 0;
            chargeTimer = 0;
        }
    }
}
#endregion
// OUTSIDE OF HIT
// Getting hit
else {
    if (hitTimer < hitTimerLimit) {
        sprite_index = spr_wizard_hit;

        hitMove = round(10 - hitTimer) / 5 * -image_xscale;
        scr_movePlayerHit(hitMove);
        hitTimer++;
    } else {
        isHit = false;
        hitTimer = 0;
    }
}

// Handle invincibility
if (isInvincible and invincTimer < invincTimerLimit) {
    invincTimer++;
} else {
    isInvincible = false;
    invincTimer = 0;
}

// Element changing from item
if (isChangingElement) {
    if (elementChangeAlpha > 0) {
        elementChangeAlpha -= elementChangeAlphaDecay;
    } else {
        isChangingElement = false;
    }
}

// Increase attack delay timer (timer == limit means attack is usable)
if (attackDelayTimer < attackDelayLimit) {
    attackDelayTimer++;
}

// Restart room
if (health <= 0 or restartPressed) {
    room_goto(room_RR_01);
    x = 144;
    y = 1712;
}

scr_setCamera();