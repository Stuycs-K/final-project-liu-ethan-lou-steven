class Button {
  private float x, y, h, w;
  private String label;
  public Button(float x, float y, float h, float w, String label) {
    this.x=x;
    this.y=y;
    this.h=h;
    this.w=w;
    this.label=label;
  }
  public boolean isTouching(float xcor, float ycor) {
    return xcor>=x && xcor<=x+w && ycor>=y-h && ycor<=y;
  }
  public float getX() {
    return x;
  }
  public float getY() {
    return y;
  }
  public float getHeight() {
    return h;
  }
  public float getWidth() {
    return w;
  }
  public String getLabel() {
    return label;
  }
}
