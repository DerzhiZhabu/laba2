import java.util.Scanner;

public class Main {
    static int checkP(int x) {
        int b = 0;
        int z;
        for (int i = x; i > 1; i--) {
            z = 1;
            for (int j = 2; j <= (int) Math.sqrt(i); j++) {
                if (i % j == 0) {
                    z = 0;
                    break;
                }
            }
            if (z == 1) {
                b = i;
                break;
            }
        }
        for (int i = x; i > 0; i++) {
            z = 1;
            for (int j = 2; j <= (int) Math.sqrt(i); j++) {
                if (i % j == 0) {
                    z = 0;
                    break;
                }
            }
            if (z == 1) {
                if (x - b > i - x) {
                    b = i;
                }
                break;
            }
        }
        return b;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int x = scanner.nextInt();
        System.out.println(Math.abs(x - checkP(x)));
    }
}