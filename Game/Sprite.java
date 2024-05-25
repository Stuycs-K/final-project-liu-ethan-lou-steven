class Sprite {
  private float xcor, ycor, h, w;
  private boolean isAlive, isJumping;
  
  public Sprite(float x, float y) {
    xcor = x;
    ycor = y;
    isAlive = true;
    isJumping = false;
    h=20; w=20;
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
  
  public void jump() {
    isJumping = true;
    
  }
    
}
