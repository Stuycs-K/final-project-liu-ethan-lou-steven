import java.util.*;
import java.io.*;
class Text {
  //static String Blockinfo = "400.0 420.0 false\n420.0 420.0 false\n440.0 420.0 true\n460.0 340.0 false\n460.0 360.0 false\n460.0 380.0 false\n460.0 400.0 false\n460.0 420.0 false\n640.0 420.0 false\n660.0 420.0 false\n680.0 420.0 false\n1360.0 420.0 true\n1380.0 420.0 true\n1400.0 420.0 true\n1420.0 420.0 true\n1440.0 420.0 true\n1460.0 420.0 true\n1480.0 420.0 true\n1560.0 420.0 false\n1580.0 420.0 false\n1600.0 420.0 false\n1760.0 400.0 false\n1760.0 420.0 false\n1820.0 380.0 false\n1820.0 400.0 false\n1820.0 420.0 false\n1880.0 360.0 false\n1880.0 380.0 false\n1880.0 400.0 false\n1880.0 420.0 false\n2180.0 420.0 false\n2260.0 400.0 false\n2340.0 380.0 false\n2420.0 360.0 false\n2500.0 340.0 false\n2580.0 340.0 false\n";
  //static String Spikeinfo = "480.0 420.0\n700.0 420.0\n720.0 420.0\n800.0 420.0\n900.0 420.0\n920.0 420.0\n1120.0 420.0\n1140.0 420.0\n1160.0 420.0\n1500.0 420.0\n1520.0 420.0\n1540.0 420.0\n2580.0 320.0\n";
  static String Blockinfo = "720.0 420.0 false\n.0 420.0 false\n800.0 400.0 false\n880.0 380.0 false\n2040.0 380.0 20 10 false\n2120.0 360.0 20 10 false\n2200.0 340.0 20 10 false\n2280.0 320.0 20 10 false\n2360.0 300.0 20 10 false\n2460.0 320.0 false\n2480.0 420.0 400 120 false\n880.0 420.0 20 40 false\n1200.0 420.0 160 20 false\n1420.0 420.0 220 20 false\n1700.0 420.0 280 40 false\n2440.0 320.0 false\n2580.0 280.0 20 10 false\n2600.0 280.0 20 10 false\n2720.0 280.0 20 10 false\n2740.0 280.0 20 10 false\n2880.0 420.0 200 100 false\n2940.0 290.0 20 10 false\n2960.0 290.0 20 10 false\n2980.0 290.0 20 10 false\n3000.0 290.0 20 10 false\n3080.0 420.0 100 120 false\n3300.0 360.0 false\n3320.0 360.0 false\n3340.0 360.0 false\n3360.0 360.0 false\n3420.0 350.0 20 10 false\n3440.0 350.0 20 10 false\n3460.0 350.0 20 10 false\n3480.0 350.0 20 10 false\n3180.0 420.0 120 80 false\n3540.0 370.0 20 10 false\n3560.0 370.0 20 10 false\n3580.0 370.0 20 10 false\n3600.0 370.0 20 10 false\n3620.0 370.0 20 10 false\n3640.0 370.0 20 10 false\n3660.0 370.0 20 10 false\n3700.0 390.0 20 10 false\n3720.0 390.0 20 10 false\n3740.0 390.0 20 10 false\n3760.0 390.0 20 10 false\n3780.0 390.0 20 10 false\n3860.0 370.0 20 10 false\n3940.0 350.0 20 10 false\n4020.0 330.0 20 10 false\n4100.0 310.0 20 10 false\n4180.0 290.0 20 10 false\n4220.0 360.0 false\n4240.0 360.0 false\n4260.0 360.0 false\n4280.0 360.0 false\n4300.0 360.0 false\n4320.0 360.0 false\n4340.0 420.0 1000 80 false\n4260.0 270.0 20 10 false\n5320.0 360.0 true\n";
  static String Spikeinfo = "340.0 420.0\n500.0 420.0\n20 10\n520.0 420.0\n680.0 420.0\n700.0 420.0\n740.0 420.0\n760.0 420.0\n780.0 420.0\n820.0 420.0\n840.0 420.0\n860.0 420.0\n1080.0 420.0\n1100.0 420.0\n1360.0 420.0\n1380.0 420.0\n1400.0 420.0\n1640.0 420.0\n1660.0 420.0\n1680.0 420.0\n1840.0 380.0\n2560.0 300.0\n2580.0 300.0\n2600.0 300.0\n2620.0 300.0\n2700.0 300.0\n2720.0 300.0\n2740.0 300.0\n2760.0 300.0\n2940.0 280.0\n2960.0 280.0\n2980.0 280.0\n3000.0 280.0\n3160.0 300.0\n3180.0 340.0\n3480.0 340.0\n3660.0 360.0\n4260.0 260.0\n4380.0 340.0\n4400.0 340.0\n4420.0 340.0\n4480.0 340.0\n4500.0 340.0\n4520.0 340.0\n4600.0 340.0\n4620.0 340.0\n4640.0 340.0\n4720.0 340.0\n4740.0 340.0\n4760.0 340.0\n4840.0 340.0\n4860.0 340.0\n4880.0 340.0\n4960.0 340.0\n4980.0 340.0\n5000.0 340.0\n5100.0 340.0\n5120.0 340.0\n5140.0 340.0\n5220.0 340.0\n5240.0 340.0\n5260.0 340.0\n";

  public static void printFile(String filename) {
    try {
      File file = new File(filename);
      Scanner sc = new Scanner(file);
      while (sc.hasNextLine()) {
        System.out.print(sc.nextLine()+"\\n");
      }
    }
    catch (IOException e) {
      
    }
  }
  public static void readBlockString(TreeSet<Block> wall) {
    String[] info = Blockinfo.split("\n", 0);
    for (String s : info) {
      String[] arr = s.split(" ", 0);
      Block b;
      if (arr.length > 3) {
        b = new Block(Float.parseFloat(arr[0]), Float.parseFloat(arr[1]), Float.parseFloat(arr[2]), Float.parseFloat(arr[3]), Boolean.parseBoolean(arr[4]));
      }
      else {
        b = new Block(Float.parseFloat(arr[0]), Float.parseFloat(arr[1]), 20, 20, Boolean.parseBoolean(arr[2]));
      }
      wall.add(b);
    }
  }
  public static void readSpikeString(TreeSet<Spike> spike) {
    String[] info = Spikeinfo.split("\n", 0);
    for (String s : info) {
      String[] arr = s.split(" ", 0);
      Spike b;
      if (arr.length > 2) {
        b = new Spike(Float.parseFloat(arr[0]), Float.parseFloat(arr[1]), Float.parseFloat(arr[2]), Float.parseFloat(arr[3]));
      }
      else {
        b = new Spike(Float.parseFloat(arr[0]), Float.parseFloat(arr[1]), 20);
      }
      //System.out.println(s);
      spike.add(b);
    }
  }
  public static void deleteAll() {
    File file = new File("walls.txt");
    String absolutePath = file.getAbsolutePath();
    File wall = new File(absolutePath);
    file = new File("spikes.txt");
    absolutePath = file.getAbsolutePath();
    File spikes = new File(absolutePath);
    System.out.println(wall.getAbsoluteFile().exists());
    System.out.println(wall.exists());
    System.out.println(spikes.exists());
    wall.delete();
    spikes.delete();
    try {
      wall.createNewFile();
      spikes.createNewFile();
    }
    catch (IOException e) {
      e.printStackTrace();
    }
  }
  public static void add(Block b) {
    try {
      FileWriter writer = new FileWriter("walls.txt", true);
      writer.write(b.getX()+" "+b.getY()+" "+b.hasJumpPad()+"\n");
      writer.close();
    }
    catch (IOException e) {
      e.printStackTrace();
    }
  }
  public static void add(Spike b) {
    try {
      File file = new File("spikes.txt");
      String absolutePath = file.getAbsolutePath();
      FileWriter writer = new FileWriter(absolutePath, true);
      writer.write(b.getX()+" "+b.getY()+"\n");
      writer.close();
    }
    catch (IOException e) {
    }
  }
  public static void remove(Block b) {
    try {
      File get = new File("walls.txt");
      String absolutePath = get.getAbsolutePath();
      File file = new File(absolutePath);
      get = new File("tempWalls.txt");
      absolutePath = get.getAbsolutePath();
      File tempFile = new File(absolutePath);
      BufferedReader reader = new BufferedReader(new FileReader(file));
      BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile));
      String check = ""+b.getX()+" "+b.getY()+" "+b.hasJumpPad();
      while (reader.ready()) {
        String s = reader.readLine();
        //System.out.print(s);
        if (s.equals(check)) {
          continue;
        }
        writer.write(s+"\n");
      }
      writer.close();
      reader.close();
      file.delete();
      try {
        tempFile.createNewFile();
      }
      catch (IOException e) {
        e.printStackTrace();
      }
      tempFile.renameTo(file);
    }
    catch (IOException e) {
    }
  }
  public static void remove(Spike b) {
    try {
      File get = new File("spikes.txt");
      String absolutePath = get.getAbsolutePath();
      File file = new File(absolutePath);
      get = new File("tempSpikes.txt");
      absolutePath = get.getAbsolutePath();
      File tempFile = new File(absolutePath);
      BufferedReader reader = new BufferedReader(new FileReader(file));
      BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile));
      String check = ""+b.getX()+" "+b.getY();
      while (reader.ready()) {
        String s = reader.readLine();
        if (s.equals(check)) {
          continue;
        }
        writer.write(s+"\n");
      }
      writer.close();
      reader.close();
      file.delete();
      try {
        tempFile.createNewFile();
      }
      catch (IOException e) {
        e.printStackTrace();
      }
      tempFile.renameTo(file);
    }
    catch (IOException e) {
    }
  }
  public static void readBlocks(TreeSet<Block> walls) {
    try {
      //File file = new File("StereoMadnessWalls.txt");
      //String absolutePath = file.getAbsolutePath();
      BufferedReader reader = new BufferedReader(new FileReader("walls.txt"));
      while (reader.ready()) {
        String s = reader.readLine();
        String[] arr = s.split(" ", 0);
        Block b;
        if (arr.length > 3) {
          b = new Block(Float.parseFloat(arr[0]), Float.parseFloat(arr[1]), Float.parseFloat(arr[2]), Float.parseFloat(arr[3]), Boolean.parseBoolean(arr[4]));
        }
        else {
          b = new Block(Float.parseFloat(arr[0]), Float.parseFloat(arr[1]), 20, 20, Boolean.parseBoolean(arr[2]));
        }
        walls.add(b);
      }
      reader.close();
    }
    catch (IOException e) {
      e.printStackTrace();
    }
  }
  public static void readSpikes(TreeSet<Spike> spikes) {
    try {
      //File file = new File("StereoMadnessSpikes.txt");
      //String absolutePath = file.getAbsolutePath();
      BufferedReader reader = new BufferedReader(new FileReader("spikes.txt"));
      while (reader.ready()) {
        String s = reader.readLine();
        String[] arr = s.split(" ", 0);
        Spike b;
        if (arr.length > 2) {
          b = new Spike(Float.parseFloat(arr[0]), Float.parseFloat(arr[1]), Float.parseFloat(arr[2]), Float.parseFloat(arr[3]));
        }
        else {
          b = new Spike(Float.parseFloat(arr[0]), Float.parseFloat(arr[1]), 20);
        }
        spikes.add(b);
      }
      reader.close();
    }
    catch (IOException e) {
      e.printStackTrace();
    }
  }
}
