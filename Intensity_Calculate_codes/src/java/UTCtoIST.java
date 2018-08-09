/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author hp
 */
import java.util.*;
import java.text.SimpleDateFormat;
public class UTCtoIST {
    
    public String convertUTC(String utc){
        String ist = "invalid UTC format";
        try{
        
          final SimpleDateFormat IST = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
          //Date date = IST.parse(ut);
          System.out.println(utc);
          //String strDate = IST.format(date.getTime());
          IST.setTimeZone(TimeZone.getTimeZone("UTC"));
          final java.util.Date dateObj = IST.parse(utc);	
	  System.out.println(dateObj);
          ist = dateObj.toString();
	}catch(Exception e){
          System.out.println(e);
	}
        System.out.println(ist);
        return ist;
    }
}
