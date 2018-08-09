import java.io.*;

public class FileRead{
   static boolean isReq(char c){
     if(c=='1'||c=='2'||c=='3'||c=='4'||c=='5'||c=='6'||c=='7'||c=='8'||c=='9'||c=='0'||c=='.'){
	   return true;
	 }
	 return false;
   }
   public String getData(){
      String result = "";
      String mag,lati,longi,hei,timeitc,date;
	  try{
	   File file = new File("C:\\\\Users\\\\hp\\\\Documents\\\\Web Applications\\\\IntensityCalculate\\\\src\\\\java\\\\SMS_L2.txt"); 
       BufferedReader br = new BufferedReader(new FileReader(file));
       String st;
       while ((st = br.readLine()) != null){
           if(st.equals("")){
		     break;
		   }
		   String[] strs = st.split(",");
		   String[] dates = strs[1].split(":");
		   date = dates[1];
		   String[] times = strs[2].split(" ");
		   timeitc = "";
		   for(int i=0;i<times.length;i++){
		     if(times[i].contains(":")){
			   timeitc = times[i];
			 }
		   }
		   mag = "";
		   for(int i=0;i<strs[0].length();i++){
		      if(isReq(strs[0].charAt(i))){
			    mag = mag+Character.toString(strs[0].charAt(i));
			  }
			  else if(!mag.equals("")){
			    break;
			  }
		   }
		   int j=0;
		   lati="";
		   for(j=0;j<strs[3].length();j++){
		      if(isReq(strs[3].charAt(j))){
			    lati = lati+Character.toString(strs[3].charAt(j));
			  }
			  else if(!lati.equals("")){
			    break;
			  }
		   }
		   longi="";
		   for(int k=j;k<strs[3].length();k++){
		      if(isReq(strs[3].charAt(k))){
			    longi = longi+Character.toString(strs[3].charAt(k));
			  }
			  else if(!longi.equals("")){
			    break;
			  }
		   }
		   hei="";
		   for(int k=0;k<strs[4].length();k++){
		      if(isReq(strs[4].charAt(k))){
			    hei = hei+Character.toString(strs[4].charAt(k));
			  }
			  else if(!hei.equals("")){
			    break;
			  }
		   }
		   System.out.println(mag);
		   System.out.println(lati);
		   System.out.println(longi);
		   System.out.println(hei);
		   System.out.println(date);
		   System.out.println(timeitc);
		   result = mag+"#"+lati+"#"+longi+"#"+hei+"#"+date+"#"+timeitc;
		   System.out.println(result);
       }
	 }
     catch(Exception e){
	   System.out.println(e);
     }
     return result;
   }
}