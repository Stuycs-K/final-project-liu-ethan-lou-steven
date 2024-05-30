import java.util.*;
import java.io.*;
class Text {
  public static void add(Block b) throws IOException {
    FileWriter writer = new FileWriter("walls.txt", true);
    writer.write(b.getX()+" "+b.getY()+" "+b.hasJumpPad()+"\n");
    writer.close();
  }
  public static void add(Spike b) throws IOException {
    FileWriter writer = new FileWriter("spikes.txt", true);
    writer.write(b.getX()+" "+b.getY()+"\n");
    writer.close();
  }
  public static void remove(Block b) throws IOException {
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
  public static void remove(Spike b) throws IOException {
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
}
