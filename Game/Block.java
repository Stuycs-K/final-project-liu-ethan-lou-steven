class Block extends Obstacle {
  private boolean jumpPad;
  private float h, w;
  public Block(float xcor, float ycor) {
    super(xcor, ycor);
    h=1;
    w=1;
    jumpPad=false;
  }
  public Block(float xcor, float ycor, float w) {
    super(xcor, ycor);
    this.h=w;
    this.w=w;
    jumpPad=false;
  }
  public Block(float xcor, float ycor, float w, float h) {
    super(xcor, ycor);
    this.h=h;
    this.w=w;
    jumpPad=false;
  }
  public Block(float xcor, float ycor, float w, float h, boolean b) {
    super(xcor, ycor);
    this.h=h;
    this.w=w;
    jumpPad=b;
  }
  public float getHeight(){return h;}
  public float getWidth(){return w;}
  public boolean hasJumpPad(){return jumpPad;}
  //Takes in x and y coordinates of a point and determines if that point lies on or within the block. 0 - not touching. 1 - touching the left or right side. 2 - touching the top or bottom.
  public int isTouching(Sprite s) {
    return 0;
  }
  public boolean isTouchingJump(Sprite s) {
    return false;
  }
}
