/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author hp
 */
import java.io.*;
public class SaveData {
  
      public void saveToFile(String data){
          try{  
          File file = new File("C:\\\\Users\\\\hp\\\\Documents\\\\Web Applications\\\\IntensityCalculate\\\\src\\\\java\\\\EQData.txt"); 
          BufferedReader br = new BufferedReader(new FileReader(file));
          String st;
          int found=0;
          while((st = br.readLine()) != null){
              if(st.equals(data)){
                  found=1;
                  break;
              }
          }
          if(found==0){
            
            BufferedWriter out = new BufferedWriter(
                   new FileWriter(file, true));
            out.write(data+"\n");
            out.close();
          }
        }
        catch(Exception e){
            System.out.println(e);
        }
      }
}
