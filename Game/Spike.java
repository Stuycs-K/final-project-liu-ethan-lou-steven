class Spike extends Obstacle implements Comparable<Spike> {
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
  public int isTouching(Sprite s) {
    float x=this.getX() + w/3 , y=this.getY();
    if (s.getX()>x+w/3 || s.getX()+s.getWidth()<x || s.getY()<y-h/2 || s.getY()-s.getHeight()>y) {
      //System.out.println(s.getY());
      return 0;
    }
    return 1;
  }
  public int compareTo(Spike s2) {
    if (this.getX()==s2.getX()) {
      return (int) (this.getY()-s2.getY());
    }
    else {
      return (int) (this.getX()-s2.getX());
    }
  }
}
