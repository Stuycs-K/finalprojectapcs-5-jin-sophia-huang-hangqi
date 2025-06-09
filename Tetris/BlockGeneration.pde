import java.util.*;

public class BlockGeneration {
  private ArrayList<Tetromino> permutation;

  public BlockGeneration() {
    permutation = new ArrayList<Tetromino>();
    permutation = randomize();
  }

  public Tetromino next() {
    if (permutation.size() == 0) {
      permutation = randomize();
    }
    return permutation.remove(0);
  }
  public ArrayList<Tetromino> randomize() {
    ArrayList<Integer> basis = new ArrayList<Integer>();
    for (int i = 0; i < 7; i++) {
      basis.add(i);
    }
    Collections.shuffle(basis);
    ArrayList<Tetromino> result = new ArrayList<Tetromino>();
    for (int i = 0; i < 7; i++) {
      result.add(new Tetromino(basis.get(i)));
    }
    return result;
  }
}
