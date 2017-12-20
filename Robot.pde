class Robot extends Enemy {
  // Requirement #5: Complete Dinosaur Class

  final int PLAYER_DETECT_RANGE_ROW = 2;
  final int LASER_COOLDOWN = 180;
  final int HAND_OFFSET_Y = 37;
  final int HAND_OFFSET_X_FORWARD = 64;
  final int HAND_OFFSET_X_BACKWARD = 16;
  int CD_Timer;
  final int CD = 180;
  Laser laser;

  void display() {

    if (speed > 0) {
      direction = RIGHT;
    } else if (speed < 0) {
      direction = LEFT;
    }

    pushMatrix();
    translate(x, y);
    if (direction == RIGHT) {
      scale(1, 1);
      image(robot, 0, 0, w, h);
    } else {
      scale(-1, 1);
      image(robot, -w, 0, w, h);
    }
    popMatrix();
  }

  void update() {
    x += speed;

    if (abs(player.y - y) <= 2*SOIL_SIZE) {
      if (direction == RIGHT) {
        if (player.x > x) {
          speed = 0;
        } else {
          speed = SPEED;
          if (x > width-80) {
            speed = -SPEED;
          }
        }
      } else {
        if (player.x < x) {
          speed = 0;
        } else {
          speed = -SPEED;
          if (x < 0) {
            speed = SPEED;
          }
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

    CD_Timer++;

    if (abs(player.y - y) <= 2*SOIL_SIZE) {
      if (CD_Timer >= CD) {
        if (direction == RIGHT) {
          laser.fire( x + 55, y + 37, player.x + 40, player.y + 40 );
          CD_Timer=0;
        } else if (direction == LEFT) {
          laser.fire( x + 25, y + 37, player.x + 40, player.y + 40 ); 
          CD_Timer=0;
        }
      }
      laser.update();
      laser.display();
      laser.checkCollision(player);
    } else {
      if (CD_Timer >= CD) {
        CD_Timer = 0;
      }
    }
  }

  Robot(float x, float y) {
    super(x, y);
    laser = new Laser();
  }

}
