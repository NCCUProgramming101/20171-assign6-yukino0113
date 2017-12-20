class Dinosaur extends Enemy {
  // Requirement #4: Complete Dinosaur Class

  final float TRIGGERED_SPEED_MULTIPLIER = 5;
  final float SPEED = 2f;

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

    x += speed;

    if (player.y == y) {
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
        if (x >= width-80) {
          speed = -SPEED;
        }
      } else {
        if (x <= 0) {
          speed = SPEED;
        }
      }
    }
  }



  Dinosaur(float x, float y) {
    super(x, y);
  }

  // HINT: Player Detection in update()
  /*
	float currentSpeed = speed
   	If player is on the same row with me AND (it's on my right side when I'm going right OR on my left side when I'm going left){
   		currentSpeed *= TRIGGERED_SPEED_MULTIPLIER
   	}
   	*/
}
