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
  private boolean jumpPad;
  private float height, width;
  public Block(float xcor, float ycor) {
    super(xcor, ycor);
    height=1.0;
    width=1.0;
    jumpPad=false;
  }
  public Block(float xcor, float ycor, float w) {
    super(xcor, ycor);
    height=w;
    width=w;
    jumpPad=false;
  }
  public Block(float xcor, float ycor, float w, float h) {
    super(xcor, ycor);
    height=h;
    width=w;
    jumpPad=false;
  }
  public Block(float xcor, float ycor, float w, float h, boolean b) {
    super(xcor, ycor);
    height=h;
    width=w;
    jumpPad=b;
  }
  public float getHeight(){return height;}
  public float getWidth(){return width;}
  public boolean hasJumpPad(){return jumpPad;}
  public int isTouching(float x, float y) {
    return 0;
  }
}

class Spike extends Obstacle {

}
