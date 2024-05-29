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
  public float isTouching(Sprite s) {
    float x=this.getX(), y=this.getY();
    if (s.getX()>x+w || s.getX()+s.getWidth()<x || s.getY()<y-h || s.getY()-s.getHeight()>y) {
      //System.out.println(s.getY());
      return 0;
    }
    if (s.getX()+s.getWidth()<x || s.getX() + s.getWidth()>=x) {
      return 2;
    }
    if (s.getY()<y-h) {
      return 1;
    }
    float left=Math.max(0, s.getX()+s.getWidth()-x), down=Math.max(0, s.getY()-(y-h));
    //if (s.getX()+s.getWidth()>=x && s.getY()>y-h && s.getX()<x) {
    //  return 1;
    //}
    //if (s.getY()>=y-h && s.getY()<y || s.getY()-s.getHeight()<=y && s.getY()>y) {
    //  return 2;
    //}
    if (left<down) {
      return 1;
    }
    return 2;
  }
  
  public boolean isTouchingJump(Sprite s) {
    return false;
  }
}
