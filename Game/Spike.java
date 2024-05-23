class Spike extends Obstacle {
  private float h, w;
  public Spike(float x, float y){
    super(x, y);
    h = (float) (Math.sqrt(3) / 2);
    w = 1;
  }
  public Spike(float x, float y, float w){
    super(x, y);
    this.w = w;
    this.h = (float) (Math.sqrt(3) / 2 * w);
  }
  public Spike(float x, float y, float w, float h){
    super(x, y);
    this.w = w;
    this.h = h;
  }
  public float getWidth() {
    return w;
  }
  public float getHeight() {
    return h;
  }
  public boolean isTouching(Sprite s) {
    return (s.getY() <= getY()) && (getY() - s.getY()) <= 2 * h * (s.getX() - getX()) && (getY() - s.getY()) <= 2 * h * (getX() + w - s.getX());
  }
}
