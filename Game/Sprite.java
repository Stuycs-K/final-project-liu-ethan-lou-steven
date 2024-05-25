class Sprite {
  private float xcor, ycor, h, w, v_initial, y_initial;
  private int jumpTime;
  private boolean isAlive, isJumping;
  private static int G = 20;
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
  public float getWidth() {
    return w;
  }
  public float getY() {
    return ycor;
  }
  
  public boolean getAlive() {
    return isAlive;
  }
  
  public boolean isJumping() {
    return isJumping;
  }
  public void updateJump(int currTime) {
    float t=(currTime-jumpTime)/2;
    ycor=y_initial+(float)(v_initial*t-0.5*10*(t*t));
  }
  public void jump(int jumpTime) {
    this.jumpTime=jumpTime;
    v_initial=5;
    isJumping = true;
    y_initial=ycor;
  }
    
}
