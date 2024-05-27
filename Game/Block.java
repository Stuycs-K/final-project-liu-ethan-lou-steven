class Block extends Obstacle {
  private boolean jumpPad;
  private int h, w;
  public Block(int xcor, int ycor) {
    super(xcor, ycor);
    h=1;
    w=1;
    jumpPad=false;
  }
  public Block(int xcor, int ycor, int w) {
    super(xcor, ycor);
    this.h=w;
    this.w=w;
    jumpPad=false;
  }
  public Block(int xcor, int ycor, int w, int h) {
    super(xcor, ycor);
    this.h=h;
    this.w=w;
    jumpPad=false;
  }
  public Block(int xcor, int ycor, int w, int h, boolean b) {
    super(xcor, ycor);
    this.h=h;
    this.w=w;
    jumpPad=b;
  }
  public int getHeight(){return h;}
  public int getWidth(){return w;}
  public boolean hasJumpPad(){return jumpPad;}
  //Takes in a Sprite and determines if it lies on or within the block. 0 - not touching. 1 - touching the left or right side. 2 - touching the top or bottom.
  public int isTouching(Sprite s) {
    int x=this.getX(), y=this.getY();
    if (s.getX()>x+w || s.getX()+s.getWidth()<x || s.getY()<y-h || s.getY()-s.getHeight()>y) {
      return 0;
    }
    if (s.getX()+s.getWidth()>=x && s.getY()>y-h && s.getX()<x) {
      return 1;
    }
    if (s.getY()>=y-h && s.getY()<y || s.getY()-s.getHeight()<=y && s.getY()>y) {
      return 2;
    }
    return 2;
  }
  
  public boolean isTouchingJump(Sprite s) {
    return false;
  }
}
