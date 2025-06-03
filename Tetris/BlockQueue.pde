import java.util.*;

public class BlockQueue{
  private ArrayList<Tetromino> nextInLine;
  
  public BlockQueue(){
    nextInLine = new ArrayList<Tetromino>();
    nextInLine.add(new Tetromino());
    nextInLine.add(new Tetromino());
    nextInLine.add(new Tetromino());
  }
  
  public Tetromino next(){
    Tetromino temp = nextInLine.remove(0);
    nextInLine.add(new Tetromino());
    return temp;
  }
}
