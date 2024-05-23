ArrayList<Block> wall = new ArrayList<Block>();
ArrayList<Spike> spike = new ArrayList<Spike>();
float shift=0;
public void display(Block b) {
  fill(255);
  rect(b.getX()-shift, b.getY()-b.getHeight(), b.getWidth(), b.getHeight());
}
void setup() {
  size(500, 500);
  for (int i=0; i<=2000; i++) {
    wall.add(new Block(i*10, 450, 10));
  }
  wall.add(new Block(1000, 440, 10));
  spike.add(new Spike(15, 6));
  
}
void draw() {
  background(12);
  for (int i=0; i<wall.size(); i++) {
    display(wall.get(i));
  }
  //for (int i=0; i<spike.size(); i++) {
  //  display(spike.get(i));
  //}
  //translate(-1, 0);
  shift+=2;
}
