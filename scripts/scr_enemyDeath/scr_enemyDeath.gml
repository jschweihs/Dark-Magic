    if(deadTimer <= deadTimerLimit) {
        deadTimer++;
        
        if(deadTimer mod 2 == 0) {
            explosionSize = floor(random(3));
        
            explosionX = x + floor(random(sprite_width)) - sprite_width/2;
            explosionY = y - floor(random(sprite_height));
            switch(explosionSize) {
            case 0:
                instance_create(explosionX, explosionY, obj_enemyExplosionS);
                break;
            case 1:
                instance_create(explosionX, explosionY, obj_enemyExplosionM);
                break;
            case 2:
                instance_create(explosionX, explosionY, obj_enemyExplosionL);
                break;
            default:
                instance_create(explosionX, explosionY, obj_enemyExplosionS);
            }
        }
    }   
    else {
        instance_destroy();
    }
