//equation for dimming effect
dim = (((sin(dimTimer/50)) *.025) +.1);

if(dimTimer < 360*pi)
    dimTimer++;
else
    dimTimer = 0;

