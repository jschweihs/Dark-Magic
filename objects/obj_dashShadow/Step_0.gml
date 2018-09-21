if(lifeTimer > 0) {
    lifeTimer -= lifespanDecel;
}
else {
    instance_destroy();
}

