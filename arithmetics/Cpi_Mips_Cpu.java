/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package arithmetics;

import java.util.stream.IntStream;

/**
 *
 * @author jegyl16
 */
public class Cpi_Mips_Cpu {
        
    public void calculateCPI(int i){
        
        // CPI is Cycle Per Instruction,
        // and calculated by: SUM(n,i=0) (CPI_i * I_i) / I_c
        
        // example:
        //
        // Instruction type     Instruction Count    Cycles per Instruction
        //------------------------------------------------------------------
        // Integer arithmetic       41000                   1
        // Data transfer            28000                   2
        // Floating point           25000                   2
        // Control transfer         6000                    2
        //------------------------------------------------------------------
        
        int[] instructionCounts = {41,28,25,6};
        int[] cycles = {1,2,2,2};
        
        
        
        int sums = 0;
        for(int n:instructionCounts){
            sums+=n;
            System.out.println(sums);
        }
        //System.out.println(sums);
    }
    
}
