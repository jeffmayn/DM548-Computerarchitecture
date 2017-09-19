package computerarchitecture;

import arithmetics.Cpi_Mips_Cpu;
import arithmetics.ConvertNumbers;
import arithmetics.SystemPerformance;


/**
 *
 * @author jegyl16
 */
public class Computerarchitecture {

    public static void main(String[] args) {


       SystemPerformance runSystemPerformance = new SystemPerformance();
       ConvertNumbers convert = new ConvertNumbers();
       Cpi_Mips_Cpu run = new Cpi_Mips_Cpu();


        // ALL PROGRAMS
        //------------------------------------------------------

        // Program 1. Compare two functions nested forloops:
        runSystemPerformance.run();

        // Program 2. Calculate CPI:
        run.calculateCPI(0);

        // Program 3. Convert positive decimal to binary digits:
        convert.decimalToBinary(24);
    }
}