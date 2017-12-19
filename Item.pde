class Item {
  boolean isAlive;
  float x, y;
  float w = SOIL_SIZE;
  float h = SOIL_SIZE;
  PImage img;
  
    Item(String filename){
    img = loadImage("img/" + filename + ".png");
    }

  void display() {
  }
  void checkCollision(Player player) {
    if (isAlive == true && isHit(x, y, w, h, player.x, player.y, player.w, player.h)) {
      addTime(CLOCK_BONUS_SECONDS);
      isAlive = false;
    }
  }

  Item(float x, float y) {
    isAlive = true;
    this.x = x;
    this.y = y;
  }
}
