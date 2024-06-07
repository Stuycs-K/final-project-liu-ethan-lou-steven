abstract class Obstacle implements Comparable<Obstacle>{
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
  public Obstacle(float x, float y, float w, float h) {
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
  abstract void display(float shift);
}

class Block extends Obstacle {
  public Block(float xcor, float ycor) {
    super(xcor, ycor);
  }
  public Block(float xcor, float ycor, float w) {
    super(xcor, ycor, w);
  }
  public Block(float xcor, float ycor, float w, float h) {
    super(xcor, ycor, w, h);
  }
  //Takes in a Sprite and determines if it lies on or within the block. 0 - not touching. 1 - touching the left or right side. 2 - touching the top or bottom.
  public float isTouching(Sprite s) {
    float x=this.getX(), y=this.getY();
    if (s.getX()>x+getWidth() || s.getX()+s.getWidth()<x || s.getY()<y-getHeight() || s.getY()-s.getHeight()>y) {
      //System.out.println(s.getY());
      return 0;
    }
    float left=Math.max(0, s.getX()+3*s.getWidth()/2-x), down=Math.max(0, s.getY()-(y-getHeight()));
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
  public int compareTo(Obstacle b2) {
    if (this.getX()==b2.getX()) {
      return (int) (this.getY()-b2.getY());
    }
    else {
      return (int) (this.getX()-b2.getX());
    }
  }
  public void display(float shift) {
    fill(255);
    rect(this.getX()-shift, this.getY()-this.getHeight(), this.getWidth(), this.getHeight());
  }
}
class JumpBlock extends Obstacle {
  public JumpBlock(float xcor, float ycor) {
    super(xcor, ycor);
  }
  public JumpBlock(float xcor, float ycor, float w) {
    super(xcor, ycor, w);
  }
  public JumpBlock(float xcor, float ycor, float w, float h) {
    super(xcor, ycor, w, h);
  }
  //Takes in a Sprite and determines if it lies on or within the block. 0 - not touching. 1 - touching the left or right side. 2 - touching the top or bottom.
  public float isTouching(Sprite s) {
    float x=this.getX(), y=this.getY();
    if (s.getX()>x+getWidth() || s.getX()+s.getWidth()<x || s.getY()<y-getHeight() || s.getY()-s.getHeight()>y) {
      //System.out.println(s.getY());
      return 0;
    }
    float left=Math.max(0, s.getX()+s.getWidth()-x), down=Math.max(0, s.getY()-(y-getHeight()));
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
  public int compareTo(Obstacle b2) {
    if (this.getX()==b2.getX()) {
      return (int) (this.getY()-b2.getY());
    }
    else {
      return (int) (this.getX()-b2.getX());
    }
  }
  public void display(float shift) {
    fill(255);
    rect(this.getX()-shift, this.getY()-this.getHeight(), this.getWidth(), this.getHeight());
    fill(255, 250, 205);
    ellipse(this.getX() + this.getWidth()/2 - shift, this.getY() - this.getHeight(), this.getWidth(), 5);
  }
}
class Spike extends Obstacle {
  public Spike(float x, float y){
    super(x, y, 20, (float) (10 * Math.sqrt(3)));
  }
  public Spike(float x, float y, float w){
    super(x, y, w, (float) (Math.sqrt(3) / 2 * w));
  }
  public Spike(float x, float y, float w, float h){
    super(x, y, w, h);
  }
  public float isTouching(Sprite s) {
    float x=this.getX() + getWidth()/4 , y=this.getY();
    if (s.getX()>x + getWidth()/2  || s.getX()+s.getWidth()<x || s.getY()<y-getHeight()/2 || s.getY()-s.getHeight()>y) {
      //System.out.println(s.getY());
      return 0;
    }
    return 1;
  }
  public int compareTo(Obstacle s2) {
    if (this.getX()==s2.getX()) {
      return (int) (this.getY()-s2.getY());
    }
    else {
      return (int) (this.getX()-s2.getX());
    }
  }
  public void display(float shift) {
    fill(255);
    triangle(this.getX()-shift, this.getY(), this.getX() - shift + this.getWidth()/2, this.getY() - this.getHeight(), this.getX() - shift + this.getWidth(), this.getY());
  }
}
abstract class Orb extends Obstacle {
  private boolean clicked;
  private String type;
  public Orb(float x, float y) {
    super(x, y, 20);
    clicked = false;
  }
  public Orb(float x, float y, float r) {
    super(x, y, r);
    clicked = false;
  }
  public String getType() {
    return type;
  }
  public void setType(String label) {
    type = label;
  }
  public boolean isClicked() {
    return clicked;
  }
  public void setClicked(boolean x) {
    clicked = x;
  }
  public float isTouching(Sprite s) {
    if ((s.getX() - this.getX() - getWidth()/2) * (s.getX() - this.getX() + getWidth()/2) + (s.getY() - this.getY()+getWidth()/2) * (s.getY() - this.getY()-getWidth()/2) > this.getWidth() * this.getWidth()) {
      return 0;
    }
    return 2;
  }
  public int compareTo(Obstacle o2) {
    if (this.getX()==o2.getX()) {
      return (int) (this.getY()-o2.getY());
    }
    else {
      return (int) (this.getX()-o2.getX());
    }
  }
  public void display(float shift) {
    fill(255);
    circle(getX()-shift+getWidth()/2, getY()-getWidth()/2, getWidth());
  }
}
class yellowOrb extends Orb{
  public yellowOrb(float x, float y) {
    super(x, y);
    setType("yellow");
  }
  public yellowOrb(float x, float y, float r) {
    super(x, y, r);
    setType("yellow");
  }
}
