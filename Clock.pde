class Clock extends Item {
  // Requirement #2: Complete Clock Class

  Clock() {
    super("clock");
  }
  void display() {
    if (isAlive == true) {
      image(clock, x, y);
    }
  }
  void checkCollision(Player player){
  if (isHit(x, y, w, h, player.x, player.y, player.w, player.h)) {
    if (isAlive == true) {
      addTime(CLOCK_BONUS_SECONDS);
      isAlive = false;
      }
    }
  }
   Clock(float x, float y) {
    super(x, y);
  }
}
