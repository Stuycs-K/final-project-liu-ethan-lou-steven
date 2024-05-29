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
  public int isTouching(Sprite s) {
    float x=this.getX() + w/3 , y=this.getY();
    if (s.getX()>x+w || s.getX()+s.getWidth()<x || s.getY()<y-2 * h/3 || s.getY()-s.getHeight()>y) {
      //System.out.println(s.getY());
      return 0;
    }
    if (s.getX()+s.getWidth()<x || s.getX()>=x) {
      return 2;
    }
    if (s.getY()<y-2 * h/3) {
      return 1;
    }
    float left=Math.max(0, s.getX()+s.getWidth()-x), down=Math.max(0, s.getY()-(y-2 * h/3));
    //if (s.getX()+s.getWidth()>=x && s.getY()>y-h && s.getX()<x) {
    //  return 1;
    //}
    //if (s.getY()>=y-h && s.getY()<y || s.getY()-s.getHeight()<=y && s.getY()>y) {
    //  return 2;
    //}
    if (left<down) {
      return 1;
    }
    return 2;
  }
}
