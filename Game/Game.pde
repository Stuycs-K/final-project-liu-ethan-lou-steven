import java.util.*;
//TreeSet<Block> wall = new TreeSet<Block>();
//TreeSet<Spike> spike = new TreeSet<Spike>();
TreeSet<Obstacle> obs = new TreeSet<Obstacle>();
int lastIndexWall, shift=0, speed=3, editShift=0;
Sprite s; Button menu;
String mode = "Play";
float angle=0;
boolean invincible = false;
Text edit = new Text();
  
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
  edit.readBlocks(obs);
  edit.readSpikes(obs);
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
  menu = new Button(0, 30, 30, 100, "Edit Map");
}
void draw() {
  background(12);
  menu.display();
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
        s.jump(2 * shift, 150);
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
  s.display(shift, angle);
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
      s.jump(2 * shift, 110);
    }
  }
}  
void keyPressed() {
  if (key=='w') {
    invincible = !invincible;
  }
  else if (key=='s') {
    if (s.getMode().equals("cube")) {
      s.setMode("ship");
    }
    else {
      s.setMode("cube");
    }
  }
}
void mouseClicked() {
  if (menu.isTouching(mouseX, mouseY)) {
    String temp=mode;
    mode=menu.getLabel();
    menu.setLabel(temp);
    shift-=editShift;
    editShift=0;
  }
  else if (mode.equals("Edit Map")) {
    int x=((int)((mouseX+shift)/20))*20, y=((int)(mouseY/20)+1)*20;
    //println(mouseX+" "+mouseY+" "+x+" "+y);
    boolean isTouchingBlock=false, isTouchingJump=false, isTouchingSpike=false;
    Obstacle b = new Block(20, 20);
    for (Obstacle i : obs) {
      if (i instanceof Block && i.getX()==x && i.getY()==y) {
        isTouchingBlock = true;
        b=i;
        break;
      }
      else if (i instanceof JumpBlock && i.getX()==x && i.getY()==y) {
        isTouchingBlock = true;
        b=i;
        isTouchingJump=true;
        break;
      }
      else if (i instanceof Spike && i.getX()==x && i.getY()==y) {
        b=i;
        isTouchingSpike=true;
        break;
      }
    }
    if (isTouchingBlock && !isTouchingJump) {
      obs.remove(b);
      edit.remove((Block)b);
      JumpBlock temp = new JumpBlock(b.getX(), b.getY(), b.getWidth(), b.getHeight());
      obs.add(temp);
      edit.add(temp);
    }
    else if (isTouchingBlock && isTouchingJump) {
      obs.remove(b);
      edit.remove((JumpBlock) b);
      Spike temp = new Spike(b.getX(), b.getY(), b.getHeight());
      obs.add(temp);
      edit.add(temp);
    }
    else if (!isTouchingBlock && !isTouchingSpike) {
      obs.add(new Block((float)x, (float)y, 20));
      edit.add(new Block((float)x, (float)y, 20));
    }
    else {
      obs.remove(b);
      edit.remove((Spike)b);
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
