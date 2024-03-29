class Dinosaur extends Enemy {
  // Requirement #4: Complete Dinosaur Class

  final float TRIGGERED_SPEED_MULTIPLIER = 5;
  final float SPEED = 1f;

  void display() {
    if (speed > 0) {
      direction = RIGHT;
    } else {
      direction = LEFT;
    }

    pushMatrix();
    translate(x, y);
    if (direction == RIGHT) {
      scale(1, 1);
      image(dinosaur, 0, 0, w, h);
    } else {
      scale(-1, 1);
      image(dinosaur, -w, 0, w, h);
    }
    popMatrix();
  }

  void update() {

    x += speed/2;

    if (player.y - y < 59 && y - player.y <= 0) {
      if (direction == RIGHT) {
        if (player.x > x) {
          speed = SPEED*TRIGGERED_SPEED_MULTIPLIER;
        }
        if (x >= width-80) {
          speed = -SPEED;
        }
      } else {
        if (player.x < x) {
          speed = -SPEED*TRIGGERED_SPEED_MULTIPLIER;
        }
        if (x <= 0) {
          speed = SPEED;
        }
      }
    } else {
      if (direction == RIGHT) {
        speed = SPEED;
        if (x >= width-80) {
          speed = -SPEED;
        }
      } else {
        speed = -SPEED;
        if (x <= 0) {
          speed = SPEED;
        }
      }
    }
  }



  Dinosaur(float x, float y) {
    super(x, y);
  }

  
}
