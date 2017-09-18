/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package computerarchitecture;

import arithmetics.Cpi_Mips_Cpu;
import arithmetics.SystemPerformance;


/**
 *
 * @author jegyl16
 */
public class Computerarchitecture {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
       // Compare two functions nested forloops 
       //SystemPerformance runSystemPerformance = new SystemPerformance();
       //runSystemPerformance.run();
       
        Cpi_Mips_Cpu run = new Cpi_Mips_Cpu();
        run.calculateCPI(0);
    }
  
}