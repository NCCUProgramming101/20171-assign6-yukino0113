class Enemy {
  float x, y;
  float w = SOIL_SIZE;
  float h = SOIL_SIZE;
  float speed = 2f;
  final float SPEED = 2f;
  int direction;

  void checkCollision(Player player) {

    if (isHit(x, y, w, h, player.x, player.y, player.w, player.h)) {

      player.hurt();
    }
  }

  void display() {
  }
  void update() {
  }

  Enemy(float x, float y) {
    this.x = x;
    this.y = y;
  }
}
