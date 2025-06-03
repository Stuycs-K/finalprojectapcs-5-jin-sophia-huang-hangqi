import java.util.*;

public class BlockQueue{
  private ArrayList<Tetromino> nextInLine;
  PFont font;
  Board smallBoard;
  
  public BlockQueue(){
    nextInLine = new ArrayList<Tetromino>();
    nextInLine.add(new Tetromino());
    nextInLine.add(new Tetromino());
    nextInLine.add(new Tetromino());
    font = createFont("Data/bruce-forever.regular.ttf", 50);
    smallBoard = new Board(4, 8, 560, 90);
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
    rect(550, 50, 120, 250, 10);
    textFont(font);
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(24);
    text("NEXT", 610, 70);
    stroke(255);
    strokeWeight(2);
    rect(560, 90, 100, 200);
    smallBoard.drawGrid();
  }
    
}
