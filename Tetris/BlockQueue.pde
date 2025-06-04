import java.util.*;

public class BlockQueue {
  private ArrayList<Tetromino> nextInLine;
  PFont font;
  Board smallBoard;

  public BlockQueue() {
    nextInLine = new ArrayList<Tetromino>();
    nextInLine.add(new Tetromino(new int[] {0, 1}));
    nextInLine.add(new Tetromino(new int[] {3, 1}));
    nextInLine.add(new Tetromino(new int[] {6, 1}));
    font = createFont("Data/bruce-forever.regular.ttf", 50);
    smallBoard = new Board(6, 10, 560, 90);
    draw();
  }

  public Tetromino next() {
    Tetromino temp = nextInLine.remove(0);
    nextInLine.add(new Tetromino(new int[] {5, 0}));
    return temp;
  }

  public void draw() {
    noStroke();
    fill(0);
    rect(550, 50, 170, 300, 10); //<>//
    textFont(font);
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(24);
    text("NEXT", 635, 70);
    stroke(255);
    strokeWeight(2);
    rect(560, 90, 150, 250);
    for (Tetromino current : nextInLine) {
      current.drawMino(true, smallBoard);
    }
    smallBoard.drawGrid();
  }
}
