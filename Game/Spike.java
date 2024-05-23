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
  public boolean isTouching(float x, float y) {
    return (y <= getY()) && (getY() - y) <= Math.sqrt(3) * (x - getX()) && (getY() - y) <= Math.sqrt(3) * (getX() + w - x);
  }
}
