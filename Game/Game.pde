import java.util.*;
ArrayList<Block> wall = new ArrayList<Block>();
ArrayList<Spike> spike = new ArrayList<Spike>();
ArrayDeque<Block> inScreen = new ArrayDeque<Block>();
int lastIndexWall, shift=0, speed=3;
float angle=0;
Sprite s;
public void display(Sprite s) {
  fill(123);
  float x1 = s.getX() + 10 + (float) (-10 * Math.cos(angle) - (-10) * Math.sin(angle));
  float y1 = s.getY() - 10 - (float) (10 * Math.sin(angle) - (-10) * Math.cos(angle));
  float x2 = s.getX() + 10 + (float) (10 * Math.cos(angle) - (-10) * Math.sin(angle));
  float y2 = s.getY() - 10 - (float) (-10 * Math.sin(angle) - (-10) * Math.cos(angle));
  float x3 = s.getX() + 10 + (float) (-10 * Math.cos(angle) - (10) * Math.sin(angle));
  float y3 = s.getY() - 10 - (float) (10 * Math.sin(angle) - (10) * Math.cos(angle));
  float x4 = s.getX() + 10 + (float) (10 * Math.cos(angle) - (10) * Math.sin(angle));
  float y4 = s.getY() - 10 - (float) (-10 * Math.sin(angle) - (10) * Math.cos(angle));
  quad(x1-shift, y1, x2-shift, y2, x4-shift, y4, x3-shift, y3);
  //rect(s.getX()-shift, s.getY()-20, 20, 20);
  s.setX(s.getX() + speed);
}
public void display(Block b) {
  fill(255);
  rect(b.getX()-shift, b.getY()-b.getHeight(), b.getWidth(), b.getHeight());
  if (b.hasJumpPad()) {
    fill(255, 250, 205);
    ellipse(b.getX() + b.getWidth()/2 - shift, b.getY() - b.getHeight(), b.getWidth(), 5);
  }
}     
public void display(Spike s) {
  fill(255);
  triangle(s.getX()-shift, s.getY(), s.getX() - shift + s.getWidth()/2, s.getY() - s.getHeight(), s.getX() - shift + s.getWidth(), s.getY());
}
public void restart() {
  shift=0;
  inScreen.clear();
  setup();
}
void setup() {
  size(500, 500);
  lastIndexWall = 0;
  for (int i=0; i<=2000; i++) {
    wall.add(new Block(i*20, 450, 20));
    if (i == 25) {
      wall.add(new Block(500, 430, 20));
      wall.add(new Block(580, 430, 20, 40));
      wall.add(new Block(660, 430, 20, 60));
      wall.add(new Block(740, 430, 20, 80, true));
      spike.add(new Spike(660, 370, 20));
    }
    //if (i % 40==0) {
    //  wall.add(new Block(i*20, 430, 20, 40));
    //}
  }
  s = new Sprite(100, 430);
  for (int i = 0; i < wall.size(); i++) {
    if (wall.get(i).getX() >= 0 && wall.get(i).getX() < width) {
      inScreen.add(wall.get(i));
      //System.out.println(inScreen.get(i).getX());
      lastIndexWall++;
      //System.out.println(lastIndexWall);
    }
    else {
      break;
    }
  }
}
void draw() {
  background(12);
  while (inScreen.peek().getX() < shift) {
    inScreen.removeFirst();
  }
  while (wall.get(lastIndexWall).getX() < shift + width) {
    inScreen.add(wall.get(lastIndexWall));
    if (lastIndexWall < wall.size()-1) {
      lastIndexWall++;
    }
  }
  for (int i=0; i<wall.size(); i++) {
    display(wall.get(i));
  }
  for (int i=0; i<spike.size(); i++) {
    display(spike.get(i));
  }
  if (s.isJumping()) {
    s.updateJump(2 * shift);
  }
  Iterator<Block> it = inScreen.iterator();
  boolean isTouchingBlock=false;
  while (it.hasNext()) {
    Block curr=it.next();
    if (curr.isTouching(s) == 2 && !curr.hasJumpPad()) {
      s.setJump(false);
      s.setY(curr.getY() - curr.getHeight());
      isTouchingBlock=true;
    }
    else if (curr.isTouching(s) == 2 && curr.hasJumpPad()) {
      s.jump(2 * shift);
    }
    else if (curr.isTouching(s)==1) {
      println("died");
      s.setAlive(false);
      restart();
      break;
    }
    //System.out.println(s.isJumping());
  }
  if (!s.getAlive()) {
    return;
  }
  if (!isTouchingBlock && s.getY()<430 && !s.isJumping()) {
    //if (s.getX()>=520) {
    //  println(s.getX()+" "+s.getY());
    //}
    s.fall(2*shift);
  }
  //System.out.println(wall.get(10).isTouching(s));
  display(s);
  if (!isTouchingBlock) {
    angle += PI/10;
    if (angle >= 2 * PI) {
      angle -= 2 * PI;
    }
  }
  if (isTouchingBlock) {
    if (angle <= PI/2) {
      angle = PI/2;
    }
    else if (angle <= PI) {
      angle = PI;
    }
    else if (angle <= 3 * PI/2) {
      angle = 3 * PI/2;
    }
    else {
      angle = 0;
    }
  }
  shift+=speed;
  //shift+=1;
}  
void keyPressed() {
  if (key==' ' && !s.isJumping()) {
    s.jump(2 * shift);
  }
}
