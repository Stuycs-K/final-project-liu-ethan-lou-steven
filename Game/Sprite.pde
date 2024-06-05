class Sprite {
  private float xcor, ycor, h, w, v_initial=100, y_initial;
  private float jumpTime;
  private boolean isAlive, isJumping;
  private float G = 80;
  private String mode = "cube";
  public Sprite(float x, float y) {
    xcor = x;
    ycor = y;
    isAlive = true;
    isJumping = false;
    h=20; w=20;
    jumpTime=0;
    v_initial=0;
    y_initial=y;
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
  public void updateJump(float currTime) {
    if (mode.equals("cube")) {
      float t = (float) ((currTime-jumpTime)/60.0);
      //System.out.prfloatln(t);
      ycor = y_initial - Math.round((float)(v_initial*t-0.5*G*(t*t)));
    }
    else if (mode.equals("ship")) {
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
    else if (mode.equals("ship")) {
      ycor-=10;
    }
  }
  public void fall(float jumpTime) {
    if (mode.equals("cube")) {
      this.jumpTime=jumpTime;
      v_initial=0;
      isJumping=true;
      y_initial=ycor;
    }
    else if (mode.equals("ship")) {
      ycor+=5;
    }
  }
  public void display(float shift, float angle) {
    fill(123);
    float x1 = s.getX() + 10 + (float) (-10 * Math.cos(angle) - (-10) * Math.sin(angle)) + speed;
    float y1 = s.getY() - 10 - (float) (10 * Math.sin(angle) - (-10) * Math.cos(angle));
    float x2 = s.getX() + 10 + (float) (10 * Math.cos(angle) - (-10) * Math.sin(angle)) + speed;
    float y2 = s.getY() - 10 - (float) (-10 * Math.sin(angle) - (-10) * Math.cos(angle));
    float x3 = s.getX() + 10 + (float) (-10 * Math.cos(angle) - (10) * Math.sin(angle)) + speed;
    float y3 = s.getY() - 10 - (float) (10 * Math.sin(angle) - (10) * Math.cos(angle));
    float x4 = s.getX() + 10 + (float) (10 * Math.cos(angle) - (10) * Math.sin(angle)) + speed;
    float y4 = s.getY() - 10 - (float) (-10 * Math.sin(angle) - (10) * Math.cos(angle));
    quad(x1-shift, y1, x2-shift, y2, x4-shift, y4, x3-shift, y3);
    //rect(s.getX()-shift, s.getY()-20, 20, 20);
    s.setX(s.getX() + speed);
  } 
}
