import java.util.*;
ArrayList<Block> wall = new ArrayList<Block>();
ArrayList<Spike> spike = new ArrayList<Spike>();
ArrayDeque<Block> inScreen = new ArrayDeque<Block>();
int lastIndexWall, shift=0, speed=3;
Sprite s; Button menu;
String mode = "Play";
public void display(Sprite s) {
  fill(123);
  rect(s.getX()-shift, s.getY()-20, 20, 20);
  s.setX(s.getX() + speed);
}
public void display(Block b) {
  fill(255);
  rect(b.getX()-shift, b.getY()-b.getHeight(), b.getWidth(), b.getHeight());
}
public void display(Spike s) {
  fill(255);
  triangle(s.getX()-shift, s.getY(), s.getX() - shift + s.getWidth()/2, s.getY() - s.getHeight(), s.getX() - shift + s.getWidth(), s.getY());
}
public void display(Button b) {
  fill(color(255, 0, 0));
  rect(b.getX(), b.getY()-b.getHeight(), b.getWidth(), b.getHeight());
  fill(0);
  text(b.getLabel(), (2*b.getX()+b.getWidth())/2-3*b.getLabel().length(), (2*b.getY()-b.getHeight())/2+5);
}
public void restart() {
  shift=0;
  inScreen.clear();
  setup();
}
void setup() {
  size(500, 500);
  lastIndexWall = 0;
  String[] wallCoords = loadStrings("walls.txt");
  for (int i=0; i<wallCoords.length; i++) {
     int space=wallCoords[i].indexOf(' ');
     int x=Integer.parseInt(wallCoords[i].substring(0, space)), y=Integer.parseInt(wallCoords[i].substring(space+1));
     wall.add(new Block(x, y, 20));
  }
  for (int i=0; i<=2000; i++) {
    wall.add(new Block(i*20, 440, 20));
    //if (i == 25) {
    //  wall.add(new Block(500, 420, 20));
    //  wall.add(new Block(580, 420, 20, 40));
    //  wall.add(new Block(660, 420, 20, 60));
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
  menu = new Button(0, 30, 30, 100, "Edit Map");
}
void draw() {
  background(12);
  display(menu);
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
  if (mode.equals("Edit Map")) {
    return;
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
      s.setY(curr.getY() - curr.getHeight());
      isTouchingBlock=true;
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
  shift+=speed;
  //shift+=1;
}  
void keyPressed() {
  if (key==' ' && !s.isJumping()) {  
    s.jump(2 * shift);
  }
}
void mouseClicked() {
  if (menu.isTouching(mouseX, mouseY)) {
    String temp=mode;
    mode=menu.getLabel();
    menu.setLabel(temp);
  }
  else if (mode.equals("Edit Map")) {
    int x=((int)((mouseX+shift)/20))*20, y=((int)(mouseY/20)+1)*20;
    println(mouseX+" "+mouseY+" "+x+" "+y);
    wall.add(new Block((float)x, (float)y, 20));
  }
}
