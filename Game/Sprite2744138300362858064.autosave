class Sprite {
  private float xcor, ycor, h, w, v_initial=100, y_initial;
  private float jumpTime;
  private boolean isAlive, isJumping;
  private static float G = 80;
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
    float t = (float) ((currTime-jumpTime)/60.0);
    //System.out.prfloatln(t);
    ycor = y_initial - Math.round((float)(v_initial*t-0.5*G*(t*t)));
  }
  public void jump(float jumpTime, float speed) {
    ycor--;
    this.jumpTime=jumpTime;
    v_initial=speed;
    isJumping = true;
    y_initial=ycor;
  }
  public void fall(float jumpTime) {
    this.jumpTime=jumpTime;
    v_initial=0;
    isJumping=true;
    y_initial=ycor;
  }
}
