class Sprite {
  private int xcor, ycor, h, w, v_initial=60, y_initial;
  private int jumpTime;
  private boolean isAlive, isJumping;
  private static int G = 30;
  public Sprite(int x, int y) {
    xcor = x;
    ycor = y;
    isAlive = true;
    isJumping = false;
    h=20; w=20;
    jumpTime=0;
    v_initial=0;
    y_initial=y;
  }
  public int getHeight() {
    return h;
  }
  public int getX() {
    return xcor;
  }
  public int setX(int value) {
    return xcor = value;
  }
  public int setY(int value) {
    return ycor = value;
  }
  public int getWidth() {
    return w;
  }
  public int getY() {
    return ycor;
  }
  public void setAlive(boolean b) {
    isAlive=b;
  }
  public boolean getAlive() {
    return isAlive;
  }
  public void setY_initial(int y) {
    y_initial=y;
  }
  public void setJump(boolean j) {
    isJumping = j;
  }
  public void setJumpTime(int v) {
    jumpTime=v;
  }
  public int getJumpTime() {
    return jumpTime;
  }
  public boolean isJumping() {
    return isJumping;
  }
  public void updateJump(int currTime) {
    float t = (float) ((currTime-jumpTime)/60.0);
    //System.out.println(t);
    ycor = y_initial - Math.round((float)(v_initial*t-0.5*G*(t*t)));
  }
  public void jump(int jumpTime) {
    ycor--;
    this.jumpTime=jumpTime;
    v_initial=60;
    isJumping = true;
    y_initial=ycor;
  }
    
}
