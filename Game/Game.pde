ArrayList<Block> wall = new ArrayList<Block>();
ArrayList<Spike> spike = new ArrayList<Spike>();
Sprite s;
float shift=0;
public void display(Sprite s) {
  fill(255);
  rect(s.getX(), s.getY()-10, 10, 10);
}
public void display(Block b) {
  fill(255);
  rect(b.getX()-shift, b.getY()-b.getHeight(), b.getWidth(), b.getHeight());
}
public void display(Spike s) {
  fill(255);
  triangle(s.getX()-shift, s.getY(), s.getX() - shift + s.getWidth()/2, s.getY() - s.getHeight(), s.getX() - shift + s.getWidth(), s.getY());
}
void setup() {
  size(500, 500);
  for (int i=0; i<=2000; i++) {
    wall.add(new Block(i*10, 450, 10));
  }
  wall.add(new Block(1000, 440, 10));
  //spike.add(new Spike(15, 440, 10));
  spike.add(new Spike(1010, 440, 10));
  s = new Sprite(100, 440);
}
void draw() {
  background(12);
  for (int i=0; i<wall.size(); i++) {
    display(wall.get(i));
  }
  for (int i=0; i<spike.size(); i++) {
    display(spike.get(i));
  }
  display(s);
  shift+=2;
}
