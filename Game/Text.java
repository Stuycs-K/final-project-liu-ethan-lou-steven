import java.util.*;
import java.io.*;
class Text {
  public static void add(Block b) {
    try {
      FileWriter writer = new FileWriter("walls.txt", true);
      writer.write(b.getX()+" "+b.getY()+" "+b.hasJumpPad()+"\n");
      writer.close();
    }
    catch (IOException e) {
    }
  }
  public static void add(Spike b) {
    try {
      FileWriter writer = new FileWriter("spikes.txt", true);
      writer.write(b.getX()+" "+b.getY()+"\n");
      writer.close();
    }
    catch (IOException e) {
    }
  }
  public static void remove(Block b) {
    try {
      File file = new File("walls.txt");
      File tempFile = new File("tempWalls.txt");
      BufferedReader reader = new BufferedReader(new FileReader(file));
      BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile));
      String check = ""+b.getX()+" "+b.getY()+" "+b.hasJumpPad();
      while (reader.ready()) {
        String s = reader.readLine();
        if (s.equals(check)) {
          continue;
        }
        writer.write(s);
      }
      writer.close();
      reader.close();
      tempFile.renameTo(file);
      file.delete();
    }
    catch (IOException e) {
    }
  }
  public static void remove(Spike b) {
    try {
      File file = new File("spikes.txt");
      File tempFile = new File("tempSpikes.txt");
      BufferedReader reader = new BufferedReader(new FileReader(file));
      BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile));
      String check = ""+b.getX()+" "+b.getY();
      while (reader.ready()) {
        String s = reader.readLine();
        if (s.equals(check)) {
          continue;
        }
        writer.write(s);
      }
      writer.close();
      reader.close();
      tempFile.renameTo(file);
      file.delete();
    }
    catch (IOException e) {
    }
  }
  public static void readBlocks(ArrayList<Block> walls) {
    try {
      BufferedReader reader = new BufferedReader(new FileReader("walls.txt"));
      while (reader.ready()) {
        String s = reader.readLine();
        String[] arr = s.split(" ", 0);
        Block b = new Block(Integer.parseInt(arr[0]), Integer.parseInt(arr[1]), 20, 20, Boolean.parseBoolean(arr[2]));
        walls.add(b);
      }
      reader.close();
    }
    catch (IOException e) {
      
    }
  }
}
