import java.util.*;
import java.io.*;
class Text {
  public static void add(Block b) throws IOException {
    FileWriter writer = new FileWriter("walls.txt", true);
    writer.write(b.getX()+" "+b.getY()+" "+b.hasJumpPad());
  }
}
