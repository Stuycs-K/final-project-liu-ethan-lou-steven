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
  public void setX(float x) {
    xcor = x;
  }
  public void setY(float y) {
    ycor = y;
  }
  public float getHeight() {
    return h;
  }
  public float getWidth() {
    return w;
  }
  public void setHeight(float h) {
    this.h = h;
  }
  public void setWidth(float w) {
    this.w = w;
  }
  abstract float isTouching(Sprite s);
  abstract void display(float shift, PImage img);
  abstract boolean isTouchingMouse(float x, float y);
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
    if (s.getMode().equals("cube")) {
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
    else if (s.getMode().equals("wave")) {
      float tipX= s.getX()+(float)(Math.cos(s.getAngle())*(s.getWidth())-Math.sin(s.getAngle())*(0));
      float tipY= s.getY()+(float)(Math.cos(s.getAngle())*(0)+Math.sin(s.getAngle())*(s.getWidth()));
      if (tipX>=getX() && tipX<=getX()+getWidth() && tipY>=getY()-getHeight() && tipY<=getY()) {
        return 1;
      }
      return 0;
    }
    return 0;
  }
  public int compareTo(Obstacle b2) {
    if (this.getX()==b2.getX()) {
      return (int) (this.getY()-b2.getY());
    }
    else {
      return (int) (this.getX()-b2.getX());
    }
  }
  public void display(float shift, PImage img) {
    image(img, getX()-shift, getY()-getHeight(), getWidth(), getHeight());
  }
  public boolean isTouchingMouse(float x, float y) {
    return (x >= getX() && x <= getX() + getWidth() && y <= getY() && y >= getY()-getHeight());
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
    if (s.getMode().equals("cube")) {
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
    else if (s.getMode().equals("wave")) {
      float tipX= s.getX()+(float)(Math.cos(s.getAngle())*(s.getWidth())-Math.sin(s.getAngle())*(0));
      float tipY= s.getY()+(float)(Math.cos(s.getAngle())*(0)+Math.sin(s.getAngle())*(s.getWidth()));
      if (tipX>=getX() && tipX<=getX()+getWidth() && tipY>=getY()-getHeight() && tipY<=getY()) {
        return 1;
      }
      return 0;
    }
    return 0;
  }
  public int compareTo(Obstacle b2) {
    if (this.getX()==b2.getX()) {
      return (int) (this.getY()-b2.getY());
    }
    else {
      return (int) (this.getX()-b2.getX());
    }
  }
  public void display(float shift, PImage img) {
    fill(255);
    rect(this.getX()-shift, this.getY()-this.getHeight(), this.getWidth(), this.getHeight());
    fill(255, 250, 205);
    ellipse(this.getX() + this.getWidth()/2 - shift, this.getY() - this.getHeight(), this.getWidth(), 5);
  }
  public boolean isTouchingMouse(float x, float y) {
    return (x >= getX() && x <= getX() + getWidth() && y <= getY() && y >= getY()-getHeight());
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
  public void display(float shift, PImage img) {
    image(img, getX()-shift, getY()-getHeight(), getWidth(), getHeight());
  }
  public boolean isTouchingMouse(float x, float y) {
    return (y <= getY() && (getY()-y) <= 2 * getHeight()/getWidth() * (x-getX()) && (getY()-y) <= -2 * getHeight()/getWidth() * (x - getX() - getWidth()));
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
    if (s.getX() > getX() + getWidth() || s.getX()+s.getWidth()<getX() || s.getY()<getY()-getHeight() || s.getY()-s.getHeight()>getY()) {
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
  abstract void display(float shift, PImage img);
  public boolean isTouchingMouse(float x, float y) {
    return (x - getX() - getWidth()/2) * (x - getX()-getWidth()/2) + (y - getY()+getWidth()/2) * (y - getY()+getWidth()/2) <= (this.getWidth()/2) * (this.getWidth()/2) ;
  }
}
class YellowOrb extends Orb{
  public YellowOrb(float x, float y) {
    super(x, y);
    setType("yellow");
  }
  public YellowOrb(float x, float y, float r) {
    super(x, y, r);
    setType("yellow");
  }
  public void display(float shift, PImage img) {
    image(img, getX()-shift, getY()-getHeight(), getWidth(), getHeight());
  }
}
class Portal extends Obstacle {
  String mode;
  public Portal(float x, float y, String mode) {
    super(x, y, 10, 50);
    this.mode=mode;
  }
  public Portal(float x, float y, float w, float h, String mode) {
    super(x, y, w, h);
    this.mode=mode;
  }
  public String getMode() {
    return mode;
  }
  public void display(float shift, PImage img) {
    image(img, getX()-shift, getY()-getHeight(), getWidth(), getHeight());
  }
  public int compareTo(Obstacle o2) {
    if (this.getX()==o2.getX()) {
      return (int) (this.getY()-o2.getY());
    }
    else {
      return (int) (this.getX()-o2.getX());
    }
  }
  public float isTouching(Sprite s) {
    if (s.getX()>getX()+getWidth() || s.getX()+s.getWidth()<getX() || s.getY()<getY()-getHeight() || s.getY()>getY()) {
      return 0;
    }
    return 1;
  }
  public boolean isTouchingMouse(float x, float y) {
    return ((x-getX()) * (x-getX()) / (getWidth()/2 * getWidth()/2)) + ((y-getY()+getHeight()/2) * (y-getY()+getHeight()/2) / (getHeight()/2 * getHeight()/2)) <= 1;
  }
}
