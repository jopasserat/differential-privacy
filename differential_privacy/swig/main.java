public class main {

  public main() {
    System.loadLibrary("carrot");
  }

  public void testEpsilon() {
     System.out.println(carrot.DefaultEpsilon());
  }

  public static void main(String argv[]) {
    main m = new main();
    m.testEpsilon();
  }
}

