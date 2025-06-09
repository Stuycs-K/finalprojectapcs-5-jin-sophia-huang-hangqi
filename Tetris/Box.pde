public class Box {
  private color c;
  private int[] position;
  private int size;
  private Tetromino associatedT;
  public Box(color boxColor, int[] pos, int s) {
    c=boxColor;
    position=pos;
    size=s;
    associatedT=null;
  }
  
  void setTetromino(Tetromino t) {
     associatedT=t;
  }
  
  Tetromino getTetromino() {
    return associatedT;
  }
  
  boolean isNotEmpty() {
    return (associatedT!=null && associatedT.getType().equals("Tetromino") && associatedT!=currentBlock);
  }
  
  color getColor() {
    return c;
  }
  
  void empty() {
    setColor(0);
    setTetromino(null);
  }
  
  void setColor(color col) {
    c=col;
  }
  
  int[] getPosition() {
    return position;
  }
  
  void drawBox() {
    if(getColor() == 0){
      strokeWeight(1);
      stroke(50);
    }
    else{
      strokeWeight(2);
      stroke(50);
    }
    fill(getColor());
    square(position[0], position[1], size);
  }
}
