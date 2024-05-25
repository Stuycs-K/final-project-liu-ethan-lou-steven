ArrayList<Block> wall = new ArrayList<Block>();
ArrayList<Spike> spike = new ArrayList<Spike>();
Sprite s;
float shift=0;
public void display(Sprite s) {
  fill(123);
  rect(s.getX(), s.getY()-20, 20, 20);
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
    wall.add(new Block(i*20, 450, 20));
  }
  wall.add(new Block(500, 430, 20));
  wall.add(new Block(800, 430, 20, 40));
  s = new Sprite(100, 430);
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
