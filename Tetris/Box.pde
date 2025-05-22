public class Box {
  private color c;
  private Box[] neighbors;
  private int[] position;
  
  public Box(color boxColor, int[] pos) {
    c=boxColor;
    position=pos;
  }
}
