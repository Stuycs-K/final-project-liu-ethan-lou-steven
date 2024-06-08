import java.util.*;
//TreeSet<Block> wall = new TreeSet<Block>();
//TreeSet<Spike> spike = new TreeSet<Spike>();
TreeSet<Obstacle> obs = new TreeSet<Obstacle>();
//ArrayDeque<Block> inScreen = new ArrayDeque<Block>();
Sprite s; ArrayList<Button> menu = new ArrayList<Button>();
String mode = "Play", editBlock = "Block";
float speed = 3.5, shift=0, editShift=0;
boolean invincible = false;
Text edit = new Text("obstacles.txt", "obstacles.txt");
  
public void restart() {
  shift=0;
  //inScreen.clear();
  delay(1000);
  setup();
}
void setup() {
  size(500, 500);
  edit.deleteAll();
  //lastIndexWall = 0;
  //Text.readBlockString(wall);
  //Text.readSpikeString(spike);
  //Text.printFile("StereoMadnessWalls.txt");
  edit.readObstacles(obs);
  //for (Block i : wall) {
  //  print(i.getX()+" "+i.getY()+" "+i.hasJumpPad()+"\\n");
  //}
  //println("\n");
  //for (Spike i : spike) {
  //  print(i.getX()+" "+i.getY()+"\\n");
  //}
  for (int i=0; i<=2000; i++) {
    obs.add(new Block(i*20, 440, 20));
  }
  s = new Sprite(100, 430);
  menu.add(new Button(0, 30, 30, 100, "Edit Map"));
  String[] names = new String[]{"Block", "JumpBlock", "Spike", "Orb", "Portal"};
  for (int i=0; i<names.length; i++) {
    menu.add(new Button(105+i*65, 15, 15, 60, names[i]));
  }
  obs.add(new Portal(600, 300, "wave"));
}
void draw() {
  background(12);
  if (mode.equals("Play")) {
    menu.get(0).display();
  }
  else {
    for (Button i : menu) {
      i.display();
    }
  }
  for (Obstacle i : obs) {
    i.display(shift);
  }
  if (mode.equals("Edit Map")) {
    return;
  }
  if (s.isJumping()) {
    s.updateJump(2 * shift);
  }
  boolean isTouchingBlock=false;
  for (Obstacle curr: obs) {
    if (curr instanceof Block) {
      if (curr.isTouching(s) == 2) {
        s.setJump(false);
        s.setY(curr.getY() - curr.getHeight());
        isTouchingBlock=true;
      }
      else if (curr.isTouching(s)==1 && !invincible) {
        println("died");
        s.setAlive(false);
        restart();
        break;
      }
      //System.out.println(s.isJumping());
    }
    else if (curr instanceof Spike) {
      if (curr.isTouching(s)>0 && !invincible) {
        println("died");
        s.setAlive(false);
        restart();
        break;
      }
    }
    else if (curr instanceof JumpBlock) {
      if (curr.isTouching(s) == 2 && !invincible) {
        s.jump(2 * shift, 120);
      }
      else if (curr.isTouching(s)==1 && !invincible) {
        println("died");
        s.setAlive(false);
        restart();
        break;
      }
    }
    else if (curr instanceof Orb) {
      Orb tempCurr = (Orb) curr;
      if (keyPressed && tempCurr.isClicked() == false && tempCurr.isTouching(s) == 2) {
        s.jump(2 * shift, 80);
        tempCurr.setClicked(true);
      }
      if (tempCurr.getX()-tempCurr.getWidth() > s.getX()) {
        tempCurr.setClicked(false);
      }
    }
    else if (curr instanceof Portal) {
      Portal p = (Portal)curr;
      if (curr.isTouching(s)==1) {
        s.setMode(p.getMode());
        s.setJump(false);
      }
    }
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
  if (!s.getAlive()) {
    return;
  }
  if (!isTouchingBlock && s.getY()<430 && !s.isJumping()) {
    s.fall(2*shift);
  }
  s.display(shift); 
  if (s.getMode().equals("cube")) {
    if (!isTouchingBlock) {
      s.setAngle(s.getAngle()+PI/10);
      if (s.getAngle() >= 2 * PI) {
        s.setAngle(s.getAngle()- 2 * PI);
      }
    }
    if (isTouchingBlock) {
      if (s.getAngle() <= PI/2) {
        s.setAngle(PI/2);
      }
      else if (s.getAngle() <= PI) {
        s.setAngle(PI);
      }
      else if (s.getAngle() <= 3 * PI/2) {
        s.setAngle(3 * PI/2);
      }
      else {
        s.setAngle(0);
      }
    }
  }
  else if (s.getMode().equals("wave")) {
    s.setAngle(3*PI/4);
  }
  //shift+=1;
  shift+=speed;
  if (keyPressed) {
    if (key==' ' && !s.isJumping()) {
      if (s.getMode().equals("wave")) {
        s.setAngle(PI/4);
      }
      s.jump(2 * shift, 80);
    }
  }
}  
void keyPressed() {
  if (key=='w') {
    invincible = !invincible;
  }
  //else if (key=='s') {
  //  if (s.getMode().equals("cube")) {
  //    s.setMode("wave");
  //    s.setJump(false);
  //  }
  //  else {
  //    s.setMode("cube");
  //  }
  //}
}
void mouseClicked() {
  if (menu.get(0).isTouching(mouseX, mouseY)) {
    String temp=mode;
    mode=menu.get(0).getLabel();
    menu.get(0).setLabel(temp);
    shift-=editShift;
    editShift=0;
  }
  else if (mode.equals("Edit Map")) {
    for (Button i : menu) {
      if (i.isTouching(mouseX, mouseY)) {
        editBlock=i.getLabel();
        return;
      }
    }
    int x=((int)((mouseX+shift)/20))*20, y=((int)(mouseY/20)+1)*20;
    boolean found=false;
    Obstacle rem = new Block(20, 20);
    for (Obstacle i : obs) {
      if (i.getClass().getSimpleName().equals(editBlock) && i.getX()==x && i.getY()==y) {
        rem=i;
        found=true;
        break;
      }
    }
    if (found) {
      obs.remove(rem);
    }
    else {
      if (editBlock.equals("Block")) {
        obs.add(new Block(x, y));
      }
      else if (editBlock.equals("JumpBlock")) {
        obs.add(new JumpBlock(x, y));
      }
      else if (editBlock.equals("Spike")) {
        obs.add(new Spike(x, y));
      }
      else if (editBlock.equals("Orb")) {
        obs.add(new yellowOrb(x, y));
      }
      else if (editBlock.equals("Portal")) {
        obs.add(new Portal(x, y, "wave"));
      }
    }
  }
}
void mouseWheel(MouseEvent event) {
  if (mode.equals("Edit Map")) {
    float num=20*(event.getCount());
    editShift+=num;
    shift+=num;
  }
}
