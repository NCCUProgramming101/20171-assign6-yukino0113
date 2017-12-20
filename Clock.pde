class Clock extends Item {
  // Requirement #2: Complete Clock Class

  Clock() {
    super("clock");
  }

  Clock(float x, float y) {
    super(x, y);
  }
  
  void checkCollision(){
  if (isAlive == true && isHit(x, y, w, h, player.x, player.y, player.w, player.h)) {
      addTime(CLOCK_BONUS_SECONDS);
      isAlive = false;
    }
  }

  void display() {
    if (isAlive == true) {
      image(clock, x, y);
    }
  }
}
