class Clock extends Item {
  // Requirement #2: Complete Clock Class

  Clock() {
    super("clock");
  }

  Clock(float x, float y) {
    super(x, y);
  }

  void display() {
    if (isAlive == true) {
      image(clock, x, y);
    }
  }
}
