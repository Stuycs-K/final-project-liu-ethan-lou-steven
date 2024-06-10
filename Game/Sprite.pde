class Sprite {
  private float xcor, ycor, h, w, v_initial=100, y_initial, angle=0;
  private float jumpTime;
  private boolean isAlive, isJumping, waveUp;
  private float G = 60;
  private String mode = "cube";
  private ArrayList<Block> waveTrail;
  public Sprite(float x, float y) {
    xcor = x;
    ycor = y;
    isAlive = true;
    isJumping = false;
    waveUp = false;
    h=20; w=20;
    jumpTime=0;
    v_initial=0;
    y_initial=y;
    waveTrail = new ArrayList<Block>();
  }
  public float getAngle() {
    return angle;
  }
  public String getMode() {
    return mode;
  }
  public float getHeight() {
    return h;
  }
  public float getX() {
    return xcor;
  }
  public float setX(float value) {
    return xcor = value;
  }
  public float setY(float value) {
    return ycor = value;
  }
  public void setMode(String s) {
    mode=s;
  }
  public void setAngle(float angle) {
    this.angle=angle;
  }
  public float getWidth() {
    return w;
  }
  public float getY() {
    return ycor;
  }
  public void setAlive(boolean b) {
    isAlive=b;
  }
  public boolean getAlive() {
    return isAlive;
  }
  public void setY_initial(float y) {
    y_initial=y;
  }
  public void setJump(boolean j) {
    isJumping = j;
  }
  public void setJumpTime(int v) {
    jumpTime=v;
  }
  public float getJumpTime() {
    return jumpTime;
  }
  public boolean isJumping() {
    return isJumping;
  }
  public boolean isWaveUp() {
    return waveUp;
  }
  public void updateJump(float currTime) {
    if (mode.equals("cube")) {
      float t = (float) ((currTime-jumpTime)/60.0);
      //System.out.prfloatln(t);
      ycor = y_initial - Math.round((float)(v_initial*t-0.5*G*(t*t)));
    }
    else if (mode.equals("wave")) {
      ycor-=5;
      y_initial=ycor;
      jumpTime=(int)currTime;
    }
  }
  public void jump(float jumpTime, float speed) {
    if (mode.equals("cube")) {
      ycor--;
      this.jumpTime=jumpTime;
      v_initial=speed;
      isJumping = true;
      y_initial=ycor;
    }
    else if (mode.equals("wave")) {
      ycor-=10;
      waveUp = true;
    }
  }
  public void fall(float jumpTime) {
    if (mode.equals("cube")) {
      this.jumpTime=jumpTime;
      v_initial=0;
      isJumping=true;
      y_initial=ycor;
    }
    else if (mode.equals("wave")) {
      ycor+=5;
      waveUp = false;
    }
  }
  public void display(float shift, PImage img) {
    if (mode.equals("wave")) {
      for (Block i : waveTrail) {
        fill(255);
        stroke(255);
        translate(i.getX()-shift-i.getWidth()/2+3.5, i.getY()-getHeight()/2);
        rotate(PI/4);
        rect(-i.getWidth()/2, -i.getHeight()/2, i.getWidth(), i.getHeight());
        rotate(-PI/4);
        translate(-(i.getX()-shift-i.getWidth()/2+3.5), -(i.getY()-getHeight()/2));
      }
    }
    translate(xcor-shift+getWidth()/2+3.5, ycor-getHeight()/2);
    rotate(angle);
    image(img, -getWidth()/2, -getHeight()/2, getWidth(), getHeight());
    //rect(s.getX()-shift, s.getY()-20, 20, 20);
    s.setX(s.getX() + speed);
    if (mode.equals("wave")) {
      waveTrail.add(new Block(getX(), getY(), 10, 10));
    }
  } 
}
