import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String[] inputs = scanner.nextLine().split(" ");
        int n = Integer.parseInt(inputs[0]);
        
        int count = 0;
        for (int i = 1; i <= n; i++) {
            int g = Integer.parseInt(inputs[i]);
            int number = g;
            while (number > 0) {
                int h = number % 10;
                number /= 10;
                if (h % 3 == 0) {
                    count += h;
                }
            }
        }
        
        System.out.println(count);
        scanner.close();
    }
}
