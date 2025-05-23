public class Box {
  private color c;
  private Box[] neighbors=new Box[4];
  private int[] position;
  private int size;
  
  public Box(color boxColor, int[] pos, int s) {
    c=boxColor;
    position=pos;
    size=s;
  }
  
  void setNeighbor(Box neighbor, int index) {
    neighbors[index]=neighbor;
  }
  
  Box getNeighbor(int dir) {
    return neighbors[dir];
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
  
  void drawBox() {
    stroke(50);
    fill(getColor());
    square(position[0], position[1], size);
  }
}
