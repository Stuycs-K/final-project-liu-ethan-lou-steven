import java.util.*;
import java.io.*;
class Text {
  //static String Blockinfo = "400.0 420.0 false\n420.0 420.0 false\n440.0 420.0 true\n460.0 340.0 false\n460.0 360.0 false\n460.0 380.0 false\n460.0 400.0 false\n460.0 420.0 false\n640.0 420.0 false\n660.0 420.0 false\n680.0 420.0 false\n1360.0 420.0 true\n1380.0 420.0 true\n1400.0 420.0 true\n1420.0 420.0 true\n1440.0 420.0 true\n1460.0 420.0 true\n1480.0 420.0 true\n1560.0 420.0 false\n1580.0 420.0 false\n1600.0 420.0 false\n1760.0 400.0 false\n1760.0 420.0 false\n1820.0 380.0 false\n1820.0 400.0 false\n1820.0 420.0 false\n1880.0 360.0 false\n1880.0 380.0 false\n1880.0 400.0 false\n1880.0 420.0 false\n2180.0 420.0 false\n2260.0 400.0 false\n2340.0 380.0 false\n2420.0 360.0 false\n2500.0 340.0 false\n2580.0 340.0 false\n";
  //static String Spikeinfo = "480.0 420.0\n700.0 420.0\n720.0 420.0\n800.0 420.0\n900.0 420.0\n920.0 420.0\n1120.0 420.0\n1140.0 420.0\n1160.0 420.0\n1500.0 420.0\n1520.0 420.0\n1540.0 420.0\n2580.0 320.0\n";
  //static String Blockinfo = "720.0 420.0 false\n.0 420.0 false\n800.0 400.0 false\n880.0 380.0 false\n2040.0 380.0 20 10 false\n2120.0 360.0 20 10 false\n2200.0 340.0 20 10 false\n2280.0 320.0 20 10 false\n2360.0 300.0 20 10 false\n2460.0 320.0 false\n2480.0 420.0 400 120 false\n880.0 420.0 20 40 false\n1200.0 420.0 160 20 false\n1420.0 420.0 220 20 false\n1700.0 420.0 280 40 false\n2440.0 320.0 false\n2580.0 280.0 20 10 false\n2600.0 280.0 20 10 false\n2720.0 280.0 20 10 false\n2740.0 280.0 20 10 false\n2880.0 420.0 200 100 false\n2940.0 290.0 20 10 false\n2960.0 290.0 20 10 false\n2980.0 290.0 20 10 false\n3000.0 290.0 20 10 false\n3080.0 420.0 100 120 false\n3300.0 360.0 false\n3320.0 360.0 false\n3340.0 360.0 false\n3360.0 360.0 false\n3420.0 350.0 20 10 false\n3440.0 350.0 20 10 false\n3460.0 350.0 20 10 false\n3480.0 350.0 20 10 false\n3180.0 420.0 120 80 false\n3540.0 370.0 20 10 false\n3560.0 370.0 20 10 false\n3580.0 370.0 20 10 false\n3600.0 370.0 20 10 false\n3620.0 370.0 20 10 false\n3640.0 370.0 20 10 false\n3660.0 370.0 20 10 false\n3700.0 390.0 20 10 false\n3720.0 390.0 20 10 false\n3740.0 390.0 20 10 false\n3760.0 390.0 20 10 false\n3780.0 390.0 20 10 false\n3860.0 370.0 20 10 false\n3940.0 350.0 20 10 false\n4020.0 330.0 20 10 false\n4100.0 310.0 20 10 false\n4180.0 290.0 20 10 false\n4220.0 360.0 false\n4240.0 360.0 false\n4260.0 360.0 false\n4280.0 360.0 false\n4300.0 360.0 false\n4320.0 360.0 false\n4340.0 420.0 1000 80 false\n4260.0 270.0 20 10 false\n5320.0 360.0 true\n";
  //static String Spikeinfo = "340.0 420.0\n500.0 420.0\n20 10\n520.0 420.0\n680.0 420.0\n700.0 420.0\n740.0 420.0\n760.0 420.0\n780.0 420.0\n820.0 420.0\n840.0 420.0\n860.0 420.0\n1080.0 420.0\n1100.0 420.0\n1360.0 420.0\n1380.0 420.0\n1400.0 420.0\n1640.0 420.0\n1660.0 420.0\n1680.0 420.0\n1840.0 380.0\n2560.0 300.0\n2580.0 300.0\n2600.0 300.0\n2620.0 300.0\n2700.0 300.0\n2720.0 300.0\n2740.0 300.0\n2760.0 300.0\n2940.0 280.0\n2960.0 280.0\n2980.0 280.0\n3000.0 280.0\n3160.0 300.0\n3180.0 340.0\n3480.0 340.0\n3660.0 360.0\n4260.0 260.0\n4380.0 340.0\n4400.0 340.0\n4420.0 340.0\n4480.0 340.0\n4500.0 340.0\n4520.0 340.0\n4600.0 340.0\n4620.0 340.0\n4640.0 340.0\n4720.0 340.0\n4740.0 340.0\n4760.0 340.0\n4840.0 340.0\n4860.0 340.0\n4880.0 340.0\n4960.0 340.0\n4980.0 340.0\n5000.0 340.0\n5100.0 340.0\n5120.0 340.0\n5140.0 340.0\n5220.0 340.0\n5240.0 340.0\n5260.0 340.0\n";
  PrintWriter walls, spikes;
  BufferedReader readWalls, readSpikes;
  
  //public static void printFile(String filename) {
  //  try {
  //    BufferedReader reader = createReader(filename);
  //    String line = reader.readLine();
  //    while (line != null) {
  //      System.out.println(line);
  //    }
  //  }
  //  catch (IOException e) {
  //    e.printStackTrace();
  //  }
  //}
  //public static void readBlockString(TreeSet<Block> wall) {
  //  String[] info = Blockinfo.split("\n", 0);
  //  for (String s : info) {
  //    String[] arr = s.split(" ", 0);
  //    Block b;
  //    if (arr.length > 3) {
  //      b = new Block(Float.parseFloat(arr[0]), Float.parseFloat(arr[1]), Float.parseFloat(arr[2]), Float.parseFloat(arr[3]), Boolean.parseBoolean(arr[4]));
  //    }
  //    else {
  //      b = new Block(Float.parseFloat(arr[0]), Float.parseFloat(arr[1]), 20, 20, Boolean.parseBoolean(arr[2]));
  //    }
  //    wall.add(b);
  //  }
  //}
  //public static void readSpikeString(TreeSet<Spike> spike) {
  //  String[] info = Spikeinfo.split("\n", 0);
  //  for (String s : info) {
  //    String[] arr = s.split(" ", 0);
  //    Spike b;
  //    if (arr.length > 2) {
  //      b = new Spike(Float.parseFloat(arr[0]), Float.parseFloat(arr[1]), Float.parseFloat(arr[2]), Float.parseFloat(arr[3]));
  //    }
  //    else {
  //      b = new Spike(Float.parseFloat(arr[0]), Float.parseFloat(arr[1]), 20);
  //    }
  //    //System.out.println(s);
  //    spike.add(b);
  //  }
  //}
  
  public void deleteAll() {
    File wall = new File("walls.txt");
    File spikes = new File("spikes.txt");
    wall.delete();
    spikes.delete();
    this.walls = createWriter("walls.txt");
    this.spikes = createWriter("spikes.txt");
  }
  
  public void add(Block b) {
    try {
      readWalls = createReader("walls.txt");
      walls = createWriter("walls.txt");
      while(readWalls.ready()) {
        String s = readWalls.readLine();
        walls.println(s);
      }
      //walls.println(b.getX()+" "+b.getY() + " " + b.hasJumpPad());
      walls.flush();
      walls.close();
      readWalls.close();
    } catch (IOException e) {
      e.printStackTrace();
    }
  }
  
  public void add(Spike b) {
    try {
      readSpikes = createReader("spikes.txt");
      spikes = createWriter("spikes.txt");
      while(readSpikes.ready()) {
        String s = readSpikes.readLine();
        spikes.println(s);
      }
      spikes.println(b.getX()+" "+b.getY());
      spikes.flush();
      spikes.close();
      readSpikes.close();
    } catch (IOException e) {
      e.printStackTrace();
    }
  }
  
  public void remove(Block b) {
    try {
      readWalls = createReader("walls.txt");
      walls = createWriter("walls.txt");
      String check = b.getX()+" "+b.getY() + " false";
      while(readWalls.ready()) {
        String s = readWalls.readLine();
        if (s.equals(check)) {
          continue;
        }
        walls.println(s);
      }
      walls.flush();
      walls.close();
      readWalls.close();
    } catch (IOException e) {
      e.printStackTrace();
    }
  }
  public void remove(Spike b) {
    try {
      readSpikes = createReader("spikes.txt");
      spikes = createWriter("spikes.txt");
      String check = b.getX()+" "+b.getY();
      while(readSpikes.ready()) {
        String s = readSpikes.readLine();
        if (s.equals(check)){
          continue;
        }
        spikes.println(s);
      }
      spikes.flush();
      spikes.close();
      readSpikes.close();
    } catch (IOException e) {
      e.printStackTrace();
    }
  }
  public void readBlocks(TreeSet<Obstacle> obs) {
    try {
      //File file = new File("StereoMadnessWalls.txt");
      //String absolutePath = file.getAbsolutePath();
      readWalls = createReader("walls.txt");
      while (readWalls.ready()) {
        String s = readWalls.readLine();
        String[] arr = s.split(" ", 0);
        if (arr.length > 3) {
          if (Boolean.parseBoolean(arr[4])) {
            obs.add(new JumpBlock(Float.parseFloat(arr[0]), Float.parseFloat(arr[1]), Float.parseFloat(arr[2]), Float.parseFloat(arr[3])));
          }
          else {
            obs.add(new Block(Float.parseFloat(arr[0]), Float.parseFloat(arr[1]), Float.parseFloat(arr[2]), Float.parseFloat(arr[3])));
          }
        }
        else {
          if (Boolean.parseBoolean(arr[2])) {
            obs.add(new JumpBlock(Float.parseFloat(arr[0]), Float.parseFloat(arr[1]), 20, 20));
          }
          else {
            obs.add(new Block(Float.parseFloat(arr[0]), Float.parseFloat(arr[1]), 20, 20));
          }
        }
      }
      readWalls.close();
    }
    catch (IOException e) {
      e.printStackTrace();
    }
  }
  public void readSpikes(TreeSet<Obstacle> obs) {
    try {
      //File file = new File("StereoMadnessSpikes.txt");
      //String absolutePath = file.getAbsolutePath();
      readSpikes = createReader("spikes.txt");
      while (readSpikes.ready()) {
        String s = readSpikes.readLine();
        String[] arr = s.split(" ", 0);
        println(s);
        if (arr.length > 2) {
          obs.add(new Spike(Float.parseFloat(arr[0]), Float.parseFloat(arr[1]), Float.parseFloat(arr[2]), Float.parseFloat(arr[3])));
        }
        else {
          obs.add(new Spike(Float.parseFloat(arr[0]), Float.parseFloat(arr[1]), 20));
        }
      }
      readSpikes.close();
    }
    catch (IOException e) {
      e.printStackTrace();
    }
  }
}
