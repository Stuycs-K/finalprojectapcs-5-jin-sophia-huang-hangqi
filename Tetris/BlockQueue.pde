import java.util.*;

public class BlockQueue {
  private ArrayList<Tetromino> nextInLine;
  PFont font;
  Board smallBoard;

  public BlockQueue() {
    nextInLine = new ArrayList<Tetromino>();
    nextInLine.add(new Tetromino(new int[] {0, 1})); //<>// //<>//
    nextInLine.add(new Tetromino(new int[] {3, 1})); //<>// //<>//
    nextInLine.add(new Tetromino(new int[] {6, 1})); //<>// //<>//
    font = createFont("Data/bruce-forever.regular.ttf", 50);
    smallBoard = new Board(6, 10, 560, 90);
    drawBox();
  }

  public Tetromino next() {
    Tetromino temp = nextInLine.remove(0);
    nextInLine.get(0).setPos(new int[] {0, 1});
    nextInLine.get(1).setPos(new int[] {3, 1});
    nextInLine.add(new Tetromino(new int[] {6, 1}));
    drawNext();
    return temp;
  }

  public void drawBox() {
    stroke(255);
    strokeWeight(3);
    fill(75);
    rect(550, 50, 170, 300, 10);
    textFont(font);
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(24);
    text("NEXT", 635, 70);
    //strokeWeight(7);
    //rect(560, 90, 150, 250);
  }
  public void drawNext() {
    for (int i = 0; i < smallBoard.getHeight(); i++) {
      for (int j = 0; j < smallBoard.getWidth(); j++) { //<>//
        smallBoard.setColor(i, j, 0);
      }
    }
    for (Tetromino current : nextInLine) {
      current.drawMino(true, smallBoard);
    }
    smallBoard.drawGrid();
  }
}
