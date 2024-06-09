import java.util.*;
//TreeSet<Block> wall = new TreeSet<Block>();
//TreeSet<Spike> spike = new TreeSet<Spike>();
TreeSet<Obstacle> obs = new TreeSet<Obstacle>();
//ArrayDeque<Block> inScreen = new ArrayDeque<Block>();
Sprite s; ArrayList<Button> menu = new ArrayList<Button>();
String mode = "Play", editBlock = "";
float speed = 3.5, shift=speed, editShift=0;
boolean invincible = false;
Obstacle inEdit;
Text edit = new Text("obstacles.txt", "obstacles.txt");
PImage BlockImg, SpriteImg, SpikeImg, WavePortalImg, YellowOrbImg;  
public void restart() {
  shift=0;
  //inScreen.clear();
  delay(1000);
  setup();
}
void setup() {
  size(500, 500);
  //edit.deleteAll();
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
  String[] names = new String[]{"Block", "JumpBlock", "Spike", "YellowOrb", "Portal"};
  for (int i=0; i<names.length; i++) {
    menu.add(new Button(105+i*65, 15, 15, 60, names[i]));
  }
  BlockImg=loadImage("RegularBlock01.png"); 
  SpriteImg=loadImage("Cube002.png");
  SpikeImg = loadImage("RegularSpike01.png");
  WavePortalImg = loadImage("WavePortalLabelled.png");
  YellowOrbImg = loadImage("YellowJumpRing.png");
}

void draw() {
  background(color(100, 100, 100));
  if (mode.equals("Play")) {
    menu.get(0).display(false);
  }
  else {
    for (Button i : menu) {
      i.display(i.getLabel().equals(editBlock));
    }
    int x=((int)((mouseX+shift)/20))*20, y=((int)(mouseY/20)+1)*20;
    tint(255, 128);
    if (editBlock.equals("Block")) {
      Block temp = new Block(x,y);
      temp.display(shift, BlockImg);
    }
    else if (editBlock.equals("JumpBlock")) {
      JumpBlock temp = new JumpBlock(x,y);
      temp.display(shift, BlockImg);
    }
    else if (editBlock.equals("Spike")) {
      Spike temp = new Spike(x,y);
      temp.display(shift, SpikeImg);
    }
    else if (editBlock.equals("YellowOrb")) {
      YellowOrb temp = new YellowOrb(x,y);
      temp.display(shift, YellowOrbImg);
    }
    else if (editBlock.equals("Portal")) {
      Portal temp = new Portal(x,y, "wave");
      temp.display(shift, WavePortalImg);
    }
    tint(255, 255);
  }
  for (Obstacle i : obs) {
    if (i == inEdit) {
      tint(255, 250, 205, 255);
    }
    if (i instanceof Block) {
      i.display(shift, BlockImg);
    }
    else if (i instanceof Spike) {
      i.display(shift, SpikeImg);
    }
    else if (i instanceof Portal) {
      i.display(shift, WavePortalImg);
    }
    else if (i instanceof YellowOrb) {
      i.display(shift, YellowOrbImg);
    }
    if (i == inEdit) {
      tint(255, 255);
    }
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
  s.display(shift, SpriteImg); 
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
  else if (key == CODED && inEdit != null && mode.equals("Edit Map")) {
    if (keyCode == UP) {
      inEdit.setY(inEdit.getY() - 2);
    }
    if (keyCode == RIGHT) {
      inEdit.setX(inEdit.getX() + 2);
    }
    if (keyCode == DOWN) {
      inEdit.setY(inEdit.getY() + 2);
    }
    if (keyCode == LEFT) {
      inEdit.setX(inEdit.getX() - 2);
    }
  }
  else if (inEdit != null && mode.equals("Edit Map")) {
    if (key == 'd') {
      obs.remove(inEdit);
      inEdit = null;
    }
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
void mouseDragged(MouseEvent event) {
  if (mode.equals("Edit Map") && inEdit != null) {
    if (pmouseX < mouseX) {
      inEdit.setWidth(inEdit.getWidth()+event.getCount());
    }
    if (pmouseX > mouseX) {
      inEdit.setWidth(inEdit.getWidth()-event.getCount());
    }
    if (pmouseY < mouseY) {
      inEdit.setHeight(inEdit.getHeight()-event.getCount());
    }
    if (pmouseY > mouseY) {
      inEdit.setHeight(inEdit.getHeight()+event.getCount());
    }
  }
}
void mouseClicked(MouseEvent event) {
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
        if (inEdit != null && !inEdit.getClass().getSimpleName().equals(editBlock)) {
          inEdit = new Block(20, 20);
          inEdit = null;
        }
        return;
      }
    }
    boolean found=false;
    //boolean delete=false;
    //Obstacle rem = new Block(20, 20);
    int x=((int)((mouseX+shift)/20))*20, y=((int)(mouseY/20)+1)*20;
    for (Obstacle i : obs) {
      if (i.getClass().getSimpleName().equals(editBlock) && (i.isTouchingMouse(mouseX+shift, mouseY))) {
        inEdit = i;
        found = true;
      }
    }
    //if (found) {
    //  obs.remove(rem);
    //}
    if (!found) {
      if (editBlock.equals("Block")) {
        inEdit = new Block(x, y);
      }
      else if (editBlock.equals("JumpBlock")) {
        inEdit = new JumpBlock(x, y);
      }
      else if (editBlock.equals("Spike")) {
        inEdit = new Spike(x, y);
      }
      else if (editBlock.equals("YellowOrb")) {
        inEdit = new YellowOrb(x, y);
      }
      else if (editBlock.equals("Portal")) {
        inEdit = new Portal(x, y, 30, 100, "wave");
      }
      if (inEdit != null) {
        obs.add(inEdit);
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
