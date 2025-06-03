import java.util.*;

public class BlockQueue{
  private ArrayList<Tetromino> nextInLine;
  PFont font;
  
  public BlockQueue(){
    nextInLine = new ArrayList<Tetromino>();
    nextInLine.add(new Tetromino());
    nextInLine.add(new Tetromino());
    nextInLine.add(new Tetromino());
    font = createFont("Data/bruce-forever.regular.ttf", 50);
    draw();
  }
  
  public Tetromino next(){
    Tetromino temp = nextInLine.remove(0);
    nextInLine.add(new Tetromino());
    return temp;
  }
  
  public void draw(){
    noStroke();
    fill(0);
    rect(550, 50, 120, 225, 5);
    textFont(font);
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(24);
    text("NEXT", 610, 75);
  }
    
}
