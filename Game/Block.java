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
  //Takes in a Sprite and determines if it lies on or within the block. 0 - not touching. 1 - touching the left or right side. 2 - touching the top or bottom.
  public int isTouching(Sprite s) {
    float x=this.getX(), y=this.getY();
    if (s.getX()>x || s.getX()+s.getWidth()<x || s.getY()<y-h || s.getY()-s.getHeight()>y) {
      return 0;
    }
    if (s.getY()==y-h || s.getY()-s.getHeight()==y) {
      return 2;
    }
    return 1;
  }
  public boolean isTouchingJump(Sprite s) {
    return false;
  }
}
