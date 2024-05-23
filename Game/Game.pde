void setup() {
  size(500, 500);
  ArrayList<Obstacle> map = new ArrayList<Obstacle>();
  for (int i=0; i<=2000; i++) {
    map.add(new Block(i, 5));
  }
  map.add(new Spike(15, 6));
}
