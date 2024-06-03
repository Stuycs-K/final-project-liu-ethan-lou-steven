import java.util.*;
import java.io.*;
class Text {
  static String Blockinfo = "400.0 420.0 false\n420.0 420.0 false\n440.0 420.0 true\n460.0 340.0 false\n460.0 360.0 false\n460.0 380.0 false\n460.0 400.0 false\n460.0 420.0 false\n640.0 420.0 false\n660.0 420.0 false\n680.0 420.0 false\n1360.0 420.0 true\n1380.0 420.0 true\n1400.0 420.0 true\n1420.0 420.0 true\n1440.0 420.0 true\n1460.0 420.0 true\n1480.0 420.0 true\n1560.0 420.0 false\n1580.0 420.0 false\n1600.0 420.0 false\n1760.0 400.0 false\n1760.0 420.0 false\n1820.0 380.0 false\n1820.0 400.0 false\n1820.0 420.0 false\n1880.0 360.0 false\n1880.0 380.0 false\n1880.0 400.0 false\n1880.0 420.0 false\n2180.0 420.0 false\n2260.0 400.0 false\n2340.0 380.0 false\n2420.0 360.0 false\n2500.0 340.0 false\n2580.0 340.0 false\n";
  static String Spikeinfo = "480.0 420.0\n700.0 420.0\n720.0 420.0\n800.0 420.0\n900.0 420.0\n920.0 420.0\n1120.0 420.0\n1140.0 420.0\n1160.0 420.0\n1500.0 420.0\n1520.0 420.0\n1540.0 420.0\n2580.0 320.0\n";
  public static void readBlockString(TreeSet<Block> wall) {
    String[] info = Blockinfo.split("\n", 0);
    for (String s : info) {
      String[] arr = s.split(" ", 0);
      Block b = new Block(Float.parseFloat(arr[0]), Float.parseFloat(arr[1]), 20, 20, Boolean.parseBoolean(arr[2]));
      wall.add(b);
    }
  }
  public static void readSpikeString(TreeSet<Spike> spike) {
    String[] info = Spikeinfo.split("\n", 0);
    for (String s : info) {
      String[] arr = s.split(" ", 0);
      Spike b = new Spike(Float.parseFloat(arr[0]), Float.parseFloat(arr[1]), 20);
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
      File file = new File("walls.txt");
      String absolutePath = file.getAbsolutePath();
      BufferedReader reader = new BufferedReader(new FileReader(absolutePath));
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
      
    }
  }
  public static void readSpikes(TreeSet<Spike> spikes) {
    try {
      File file = new File("walls.txt");
      String absolutePath = file.getAbsolutePath();
      BufferedReader reader = new BufferedReader(new FileReader(absolutePath));
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
      
    }
  }
}
