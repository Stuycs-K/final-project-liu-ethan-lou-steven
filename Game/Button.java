class Button {
  private float x, y, h, w;
  public Button(float x, float y, float h, float w) {
    this.x=x;
    this.y=y;
    this.h=h;
    this.w=w;
  }
  public boolean isTouching(float xcor, float ycor) {
    return xcor>=x && xcor<=x+w && ycor>=y-h && ycor<=y;
  }
  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }
  public int getHeight() {
    return h;
  }
  public int getWidth() {
    return w;
  }
}
