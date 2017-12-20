class Cabbage extends Item {
  // Requirement #1: Complete Cabbage Class

  Cabbage() {
    super("cabbage");
  }
  void display() {
    if (isAlive == true) {
      image(cabbage, x, y);
    }
  }
  void checkCollision(Player player) {
    if (isAlive == true && isHit(x, y, w, h, player.x, player.y, player.w, player.h)) {
      if (player.health < player.PLAYER_MAX_HEALTH) {
        player.health ++;
        isAlive = false;
      }
    }
  }
   Cabbage(float x, float y) {
    super(x, y);
  }
}
