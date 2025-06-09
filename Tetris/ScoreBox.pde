public class ScoreBox {
  private int score;
  private int level;
  private int totalRowsCleared;
  PFont font;

  public ScoreBox() {
    score = 0;
    level = 1;
    totalRowsCleared = 0;
    font = createFont("Data/bruce-forever.regular.ttf", 50);
    drawBox();
  }

  public void addScore(int scored) {
    score += scored;
  }
  public void addRows(int rowed) {
    totalRowsCleared += rowed;
  }
  public int increLevel() {
    int speed = 40;
    if (totalRowsCleared >= 10) {
      speed = 30;
      level = 2;
    }
    if (totalRowsCleared >= 20) {
      speed = 20;
      level = 3;
    }
    if (totalRowsCleared >= 30) {
      speed = 15;
      level = 4;
    }
    return speed;
  }
  public void drawBox() {
    fill(75);
    stroke(255);
    strokeWeight(3);
    rect(105, 350, 125, 180, 10);
    textFont(font);
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(15);
    text("SCORE", 105 + 125/2, 365);
    text("LEVEL", 105 + 125/2, 425);
    text("LINES", 105 + 125/2, 485);
    drawNext();
  }
  public void drawNext() {
    fill(25);
    stroke(255);
    strokeWeight(3);
    rect(117.5, 380, 100, 20);
    rect(117.5, 440, 100, 20);
    rect(117.5, 500, 100, 20);
    textFont(font);
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(12);
    text(score, 105 + 125/2, 390);
    text(level, 105 + 125/2, 449);
    text(totalRowsCleared, 105 + 125/2, 510);
  }

  public int getLevel() {
    return level;
  }
  public int getScore() {
    return score;
  }
}
