package arithmetics;

public class ConvertNumbers {
    public static void main(String[] args) {

        // convert positive integers to binary digits:
        decimalToBinary(21);
    }

    public static void decimalToBinary(int num){
        System.out.println("Convert decimal '" + num + "' to binary digits:\n");
        System.out.printf("%-16s %3s %19s", "Division", "Quotient", "Remainder");
        System.out.println("\n---------------------------------------------");
        int binary[] = new int[100];
        int index = 0;

        while(num > 0){
            binary[index++] = num%2;
            System.out.printf("%-16s %3s %19s", num+"/2", num/2, num%2+"\n");
            num = num/2;
        }
        System.out.print("---------------------------------------------\nResult: ");

        for(int i = index-1;i >= 0;i--){
            System.out.print(binary[i]);
        }
        System.out.println("");
    }
}
