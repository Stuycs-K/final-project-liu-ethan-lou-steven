class Obstacle {
  private float xcor, ycor;
  public Obstacle(float x, float y) {
    xcor=x;
    ycor=y;
  }
  public float getX() {
    return xcor;
  }
  public float getY() {
    return ycor;
  }
}

class Block extends Obstacle {
  
}

class Spike extends Obstacle {

}
