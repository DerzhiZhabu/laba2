import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import java.util.Vector;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Map<Integer, Vector<Integer>> wh = new HashMap<>();
        Vector<Integer> keys = new Vector<>();
        Map<Character, Integer> col = Map.of('R', 0, 'W', 1, 'B', 2);

        String a = scanner.nextLine();

        for (int i = 0; i < a.length() / 2; i++) {
            int colc = Character.getNumericValue(a.charAt(i * 2 + 1));
            if (wh.containsKey(colc)) {
                wh.get(colc).set(col.get(a.charAt(i * 2)), 1);
            } else {
                Vector<Integer> colors = new Vector<>(3);
                colors.add(0);
                colors.add(0);
                colors.add(0);
                colors.set(col.get(a.charAt(i * 2)), 1);
                wh.put(colc, colors);
                keys.add(colc);
            }
        }

        int count = 0;
        for (int i = 0; i < keys.size(); i++) {
            Vector<Integer> b = wh.get(keys.get(i));
            if (b != null && b.get(0) + b.get(1) + b.get(2) == 3) {
                count++;
            }
        }

        System.out.println(count);
        scanner.close();
    }
}