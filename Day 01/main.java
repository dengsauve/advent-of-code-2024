import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.Scanner;

public class main {
    public static int[] convertStringArrayToIntArray(String[] inArr) {
        
    }

    public static void main(String[] args) throws FileNotFoundException {
        // Read and process input
        Scanner in = new Scanner(new FileReader("input.txt"));
        StringBuilder firstStringList = new StringBuilder();
        StringBuilder secondStringList = new StringBuilder();
        int counter = 1;
        while (in.hasNext()) {
            if (counter % 2 == 1) {
                firstStringList.append(in.next() + " ");
            } else {
                secondStringList.append(in.next() + " ");
            }
            counter++;
        }
        in.close();

        System.out.println(firstStringList.toString());
        System.out.println(secondStringList.toString());

        // Convert String list to Integer Arr
        String[] firstStringArr = firstStringList.toString().split("/\s/");
        String[] secondStringArr = secondStringList.toString().split("/\s/");

        int[] firstArr = new int[firstStringArr.length];
        int[] secondArr = new int[secondStringArr.length];

        for(int i = 0;i < numberStrs.length;i++)
        {
            numbers[i] = Integer.parseInt(numberStrs[i]);
        }
    }
}
