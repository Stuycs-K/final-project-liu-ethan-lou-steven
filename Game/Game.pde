ArrayList<Block> wall = new ArrayList<Block>();
ArrayList<Spike> spike = new ArrayList<Spike>();
public void display(Block b) {
  fill(255);
  rect(b.getX(), b.getY()-b.getHeight(), b.getWidth(), b.getHeight());
}
void setup() {
  size(500, 500);
  for (int i=0; i<=2000; i++) {
    wall.add(new Block(i*10, 450, 10));
  }
  spike.add(new Spike(15, 6));
}
void draw() {
  for (int i=0; i<wall.size(); i++) {
    display(wall.get(i));
  }
}
