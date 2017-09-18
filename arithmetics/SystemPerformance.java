package arithmetics;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author jegyl16
 */
public class SystemPerformance {
    
    public void run(){

    int[][] src = new int[2048][2048];
    int[][] dst = new int[2048][2048];
    
    long start = System.currentTimeMillis();
    copyij(src, dst);
    long end = (System.currentTimeMillis() - start);
    System.out.println("\n1. total time: " + end + " ms");
    
    long start2 = System.currentTimeMillis();
    copyij_2(src, dst);
    long end2 = (System.currentTimeMillis() - start2);
    System.out.println("\n2. total time: " + end2 + " ms");


}
    
    private static void copyij(int[][] src, int[][] dst) {
        int i,j;
        for(i=0; i<2048; i++){
            for(j=0; j< 2048; j++){
                dst[i][j] = src[i][j];
            }
        }
    }
    private static void copyij_2(int[][] src, int[][] dst) {
        int i,j;
        for(j=0; j<2048; j++){
            for(i=0; i< 2048; i++){
                dst[i][j] = src[i][j];
            }
        }
    }
    
    

}

