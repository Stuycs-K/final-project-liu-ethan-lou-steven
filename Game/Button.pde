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
  public void setLabel(String newLabel) {
    label=newLabel;
  }
  public void display(boolean pick, PImage img) {
    if (pick) {
      float shrink=1;
      image(img, getX()+shrink, getY()-getHeight()+shrink, getWidth()-2*shrink, getHeight()-2*shrink);
      float x=getX()+shrink, y=getY()-shrink, w=getWidth()-2*shrink, h=getHeight()-2*shrink;
      text(getLabel(), (2*x+w-10)/2-3*getLabel().length(), (2*y-h)/2+5);
    }
    else {
      image(img, getX(), getY()-getHeight(), getWidth(), getHeight());
      text(getLabel(), (2*getX()+getWidth())/2-3*getLabel().length(), (2*getY()-getHeight())/2+5);
    }
    
  }
}
