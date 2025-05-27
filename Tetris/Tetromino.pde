public class Tetromino {
  private color c;
  private char shape;
  private int[][][] positions;
  private int currentPosition;
  
  public Tetromino() {
    int[] colors={#e39f02, #0f9bd7, #59b101, #d70f37, #e35b02, #2141c6, #af298a};
    char[] shapes = {'O', 'I', 'S', 'Z', 'L', 'J', 'T'};
    int type = (int)(7*Math.random());
    c=colors[type];
    shape=shapes[type];
    currentPosition=0;
    if (shape=='O') {
      positions = new int[][][]
      {{{0, 0, 0, 0},
      {0, 1, 1, 0}, 
      {0, 1, 1, 0},
      {0, 0, 0, 0}}};}
     if (shape=='I') {
       positions = new int[][][]
      {{{0, 0, 0, 0},
      {1, 1, 1, 1}, 
      {0, 0, 0, 0},
      {0, 0, 0, 0}},
    
     {{0, 0, 1, 0},
      {0, 0, 1, 0}, 
      {0, 0, 1, 0},
      {0, 0, 1, 0}},
    
     {{0, 0, 0, 0},
      {0, 0, 0, 0}, 
      {1, 1, 1, 1},
      {0, 0, 0, 0}},
    
     {{0, 1, 0, 0},
      {0, 1, 0, 0}, 
      {0, 1, 0, 0},
      {0, 1, 0, 0}}};   
    }
    if (shape=='S') {
       positions = new int[][][]
      {{{0, 0, 0, 0},
      {0, 0, 1, 1}, 
      {0, 1, 1, 0},
      {0, 0, 0, 0}},
    
     {{0, 0, 0, 0},
      {0, 1, 0, 0}, 
      {0, 1, 1, 0},
      {0, 0, 1, 0}},
    
     {{0, 0, 0, 0},
      {0, 1, 1, 0}, 
      {1, 1, 0, 0},
      {0, 0, 0, 0}},
    
     {{0, 1, 0, 0},
      {0, 1, 1, 0}, 
      {0, 0, 1, 0},
      {0, 0, 0, 0}}};   
    }
     }
 }
