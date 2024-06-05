abstract class Obstacle {
  private float xcor, ycor, h, w;
  public Obstacle(float x, float y) {
    xcor=x;
    ycor=y;
    h=20;
    w=20;
  }
  public Obstacle(float x, float y, float h) {
    xcor=x;
    ycor=y;
    this.h=h;
    this.w=h;
  }
  public Obstacle(float x, float y, float h, float w) {
    xcor=x;
    ycor=y;
    this.h=h;
    this.w=w;
  }
  public float getX() {
    return xcor;
  }
  public float getY() {
    return ycor;
  }
  public float getHeight() {
    return h;
  }
  public float getWidth() {
    return w;
  }
  abstract float isTouching(Sprite s);
  abstract void display(int shift);
}

class Block extends Obstacle implements Comparable<Block> {
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
  public void setJumpPad(boolean b){jumpPad=b;}
  //Takes in a Sprite and determines if it lies on or within the block. 0 - not touching. 1 - touching the left or right side. 2 - touching the top or bottom.
  public float isTouching(Sprite s) {
    float x=this.getX(), y=this.getY();
    if (s.getX()>x+w || s.getX()+s.getWidth()<x || s.getY()<y-h || s.getY()-s.getHeight()>y) {
      //System.out.println(s.getY());
      return 0;
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
  public int compareTo(Block b2) {
    if (this.getX()==b2.getX()) {
      return (int) (this.getY()-b2.getY());
    }
    else {
      return (int) (this.getX()-b2.getX());
    }
  }
  public void display(int shift) {
    fill(255);
    rect(this.getX()-shift, this.getY()-this.getHeight(), this.getWidth(), this.getHeight());
    if (this.hasJumpPad()) {
      fill(255, 250, 205);
      ellipse(this.getX() + this.getWidth()/2 - shift, this.getY() - this.getHeight(), this.getWidth(), 5);
    }
  }
}

class Spike extends Obstacle implements Comparable<Spike> {
  private float h, w;
  public Spike(float x, float y){
    super(x, y);
    h = (float) (Math.sqrt(3) / 2);
    w = 1;
  }
  public Spike(float x, float y, float w){
    super(x, y);
    this.w = w;
    this.h = (float) (Math.sqrt(3) / 2 * w);
  }
  public Spike(float x, float y, float w, float h){
    super(x, y);
    this.w = w;
    this.h = h;
  }
  public float getWidth() {
    return w;
  }
  public float getHeight() {
    return h;
  }
  public float isTouching(Sprite s) {
    float x=this.getX() + w/3 , y=this.getY();
    if (s.getX()>x+w/3 || s.getX()+s.getWidth()<x || s.getY()<y-h/2 || s.getY()-s.getHeight()>y) {
      //System.out.println(s.getY());
      return 0;
    }
    return 1;
  }
  public int compareTo(Spike s2) {
    if (this.getX()==s2.getX()) {
      return (int) (this.getY()-s2.getY());
    }
    else {
      return (int) (this.getX()-s2.getX());
    }
  }
  public void display(int shift) {
    fill(255);
    triangle(this.getX()-shift, this.getY(), this.getX() - shift + this.getWidth()/2, this.getY() - this.getHeight(), this.getX() - shift + this.getWidth(), this.getY());
  }
}
