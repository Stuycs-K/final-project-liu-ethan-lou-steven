class Spike extends Obstacle {
  private int h, w;
  public Spike(int x, int y){
    super(x, y);
    h = (int) (Math.sqrt(3) / 2);
    w = 1;
  }
  public Spike(int x, int y, int w){
    super(x, y);
    this.w = w;
    this.h = (int) (Math.sqrt(3) / 2 * w);
  }
  public Spike(int x, int y, int w, int h){
    super(x, y);
    this.w = w;
    this.h = h;
  }
  public int getWidth() {
    return w;
  }
  public int getHeight() {
    return h;
  }
  public boolean isTouching(Sprite s) {
    return (s.getY() <= getY()) && (getY() - s.getY()) <= 2 * h * (s.getX() - getX()) && (getY() - s.getY()) <= 2 * h * (getX() + w - s.getX());
  }
}
