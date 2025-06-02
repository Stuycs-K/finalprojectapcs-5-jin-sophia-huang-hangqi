public class Box {
  private color c;
  private int[] position;
  private int size;
  
  public Box(color boxColor, int[] pos, int s) {
    c=boxColor;
    position=pos;
    size=s;
  }
  
  boolean isNotEmpty() {
    return (c!=0);
  }
  
  color getColor() {
    return c;
  }
  
  void setColor(color col) {
    c=col;
  }
  
  int[] getPosition() {
    return position;
  }
  
  void drawBox() {
    stroke(50);
    fill(getColor());
    square(position[0], position[1], size);
  }
}
