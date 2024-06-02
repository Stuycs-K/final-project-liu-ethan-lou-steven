import java.util.*;
ArrayList<Block> wall = new ArrayList<Block>();
ArrayList<Spike> spike = new ArrayList<Spike>();
//ArrayDeque<Block> inScreen = new ArrayDeque<Block>();
int lastIndexWall, shift=0, speed=3;
Sprite s; Button menu;
String mode = "Play";
float angle=0;
public void display(Sprite s) {
  fill(123);
  float x1 = s.getX() + 10 + (float) (-10 * Math.cos(angle) - (-10) * Math.sin(angle)) + speed;
  float y1 = s.getY() - 10 - (float) (10 * Math.sin(angle) - (-10) * Math.cos(angle));
  float x2 = s.getX() + 10 + (float) (10 * Math.cos(angle) - (-10) * Math.sin(angle)) + speed;
  float y2 = s.getY() - 10 - (float) (-10 * Math.sin(angle) - (-10) * Math.cos(angle));
  float x3 = s.getX() + 10 + (float) (-10 * Math.cos(angle) - (10) * Math.sin(angle)) + speed;
  float y3 = s.getY() - 10 - (float) (10 * Math.sin(angle) - (10) * Math.cos(angle));
  float x4 = s.getX() + 10 + (float) (10 * Math.cos(angle) - (10) * Math.sin(angle)) + speed;
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
public void display(Button b) {
  fill(color(255, 0, 0));
  rect(b.getX(), b.getY()-b.getHeight(), b.getWidth(), b.getHeight());
  fill(0);
  text(b.getLabel(), (2*b.getX()+b.getWidth())/2-3*b.getLabel().length(), (2*b.getY()-b.getHeight())/2+5);
}
public void restart() {
  shift=0;
  //inScreen.clear();
  delay(1000);
  setup();
}
void setup() {
  size(500, 500);
  //lastIndexWall = 0;
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
    //  wall.add(new Block(740, 430, 20, 80, true));
    //  spike.add(new Spike(660, 370, 20));
    //}
    //if (i % 40==0) {
    //  wall.add(new Block(i*20, 430, 20, 40));
    //}
  }
  s = new Sprite(100, 430);
  //for (int i = 0; i < wall.size(); i++) {
  //  if (wall.get(i).getX() >= 0 && wall.get(i).getX() < width) {
  //    inScreen.add(wall.get(i));
  //    //System.out.println(inScreen.get(i).getX());
  //    lastIndexWall++;
  //    //System.out.println(lastIndexWall);
  //  }
  //  else {
  //    break;
  //  }
  //}
  menu = new Button(0, 30, 30, 100, "Edit Map");
}
void draw() {
  background(12);
  display(menu);
  //while (inScreen.peek().getX() < shift) {
  //  inScreen.removeFirst();
  //}
  //while (wall.get(lastIndexWall).getX() < shift + width) {
  //  inScreen.add(wall.get(lastIndexWall));
  //  if (lastIndexWall < wall.size()-1) {
  //    lastIndexWall++;
  //  }
  //}
  for (Block i : wall) {
    display(i);
  }
  for (Spike i : spike) {
    display(i);
  }
  if (mode.equals("Edit Map")) {
    return;
  }
  if (s.isJumping()) {
    s.updateJump(2 * shift);
  }
  //Iterator<Block> it = inScreen.iterator();
  boolean isTouchingBlock=false;
  for (Block curr: wall) {
    if (curr.isTouching(s) == 2 && !curr.hasJumpPad()) {
      s.setJump(false);
      s.setY(curr.getY() - curr.getHeight());
      isTouchingBlock=true;
    }
    else if (curr.isTouching(s) == 2 && curr.hasJumpPad()) {
      s.jump(2 * shift, 150);
    }
    else if (curr.isTouching(s)==1) {
      println("died");
      s.setAlive(false);
      restart();
      break;
    }
    //System.out.println(s.isJumping());
  }
  //for (Block curr : wall) {
  //  if (curr.isTouching(s) == 2 && !curr.hasJumpPad()) {
  //    s.setJump(false);
  //    s.setY(curr.getY() - curr.getHeight());
  //    isTouchingBlock=true;
  //  }
  //  else if (curr.isTouching(s) == 2 && curr.hasJumpPad()) {
  //    s.jump(2 * shift, 150);
  //  }
  //  else if (curr.isTouching(s)==1) {
  //    println("died");
  //    s.setAlive(false);
  //    restart();
  //    break;
  //  }
  //}
  for (Spike curr : spike) {
    if (curr.isTouching(s)>0) {
      println("died");
      s.setAlive(false);
      restart();
      break;
    }
  }
  if (!s.getAlive()) {
    return;
  }
  if (!isTouchingBlock && !s.isJumping()) {
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
  //shift+=1;
  shift+=speed;
  if (keyPressed) {
    if (key==' ' && !s.isJumping()) {  
    s.jump(2 * shift, 100);
    }
  }
}  
//void keyPressed() {
//  if (key==' ' && !s.isJumping()) {  
//    s.jump(2 * shift, 100);
//  }
//}
void mouseClicked() {
  if (menu.isTouching(mouseX, mouseY)) {
    String temp=mode;
    mode=menu.getLabel();
    menu.setLabel(temp);
  }
  else if (mode.equals("Edit Map")) {
    int x=((int)((mouseX+shift)/20))*20, y=((int)(mouseY/20)+1)*20;
    //println(mouseX+" "+mouseY+" "+x+" "+y);
    boolean isTouchingBlock=false, isTouchingJump=false, isTouchingSpike=false;
    Block b = new Block(20, 20);
    for (Block i : wall) {
      if (i.getX()==x && i.getY()==y) {
        isTouchingBlock = true;
        b=i;
        isTouchingJump=i.hasJumpPad();
        break;
      }
    }
    Spike rem = new Spike(20, 20);
    for (Spike i : spike) {
      if (i.getX()==x && i.getY()==y) {
        rem=i;
        isTouchingSpike=true;
        break;
      }
    }
    if (isTouchingBlock && !b.hasJumpPad()) {
      wall.remove(b);
      b.setJumpPad(true);
      wall.add(b);
    }
    else if (isTouchingBlock) {
      wall.remove(b);
      Spike temp = new Spike(b.getX(), b.getY(), b.getHeight());
      spike.add(temp);
    }
    else if (!isTouchingBlock && !isTouchingSpike) {
      wall.add(new Block((float)x, (float)y, 20));
    }
    else {
      spike.remove(rem);
    }
  }
}
