import java.util.*;
ArrayList<Block> wall = new ArrayList<Block>();
ArrayList<Spike> spike = new ArrayList<Spike>();
ArrayDeque<Block> inScreen = new ArrayDeque<Block>();
int lastIndexWall, shift=0, lastJumpTime;
float lastY=430;
Sprite s;
public void display(Sprite s) {
  fill(123);
  rect(s.getX()-shift, s.getY()-20, 20, 20);
  s.setX(s.getX() + 3);
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
  lastIndexWall = 0;
  for (int i=0; i<=2000; i++) {
    wall.add(new Block(i*20, 450, 20));
    if (i == 25) {
      wall.add(new Block(500, 430, 20));
    }
    if (i == 40) {
      wall.add(new Block(800, 430, 20, 40));
    }
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
    if (curr.isTouching(s) == 2) {
      s.setJump(false);
      lastJumpTime=2*shift-s.getJumpTime();
      s.setY(curr.getY() - curr.getHeight());
      isTouchingBlock=true;
    }
    //System.out.println(s.isJumping());
  }
  if (!isTouchingBlock && s.getY()<430 && !s.isJumping()) {
    s.setJump(true);
    s.setJumpTime(2*shift-lastJumpTime);
    s.setY_initial(lastY);
  }
  //System.out.println(wall.get(10).isTouching(s));
  display(s);
  shift+=3;
}  
void keyPressed() {
  if (key==' ' && !s.isJumping()) {
    s.jump(2 * shift);
    lastY=s.getY();
  }
}
