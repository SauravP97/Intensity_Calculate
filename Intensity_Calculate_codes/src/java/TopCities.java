import java.io.*;
import java.util.*;
class City implements Comparable{
  String details;
  double lati,longi,intensity;
  
  City(String details,double lati,double longi,double intensity){
     this.details = details;
	 this.lati = lati;
	 this.longi = longi;
	 this.intensity = intensity;
  }
  String getDetails(){
    return details;
  }
  double getLati(){
    return lati;
  }
  double getLongi(){
    return longi;
  }
  double getIntensity(){
    return intensity;
  }
  public int compareTo(Object o1){
    City obj = (City)o1;
	double res = obj.getIntensity()-this.getIntensity();
	if(res<0){
	 return -1;
	}
    else if(res>0){
	  return 1;
    }
    return 0;	
  }
}
public class TopCities{
  double plati,plongi,magni,hei;
  
  public double toRadians(double angle) {
          return angle*(Math.PI / 180);
  }
   
  TopCities(double plati,double plongi,double magni,double hei){
     this.plati = plati;
	 this.plongi = plongi;
	 this.magni = magni;
	 this.hei = hei;
  }
  public double calci(double lati,double longi){
                double r = 6371;
				double x = plongi;
				double y = plati;
		                double a = Math.sin(toRadians(90-y))*Math.sin(toRadians(90-lati));
				double p = Math.cos(toRadians(x-longi));
				double xi = Math.cos(toRadians(90-y))*Math.cos(toRadians(90-lati));
				double di = Math.acos(xi+(a*p))*r;
				double d = Math.sqrt(di*di + hei*hei);
				double intensity = 6.15+1.13*magni-0.0006*d-3.12*Math.log10(d);
                			
				 return intensity;
  }
  public String getRoman(double val){
      String res = "";
      double intensity = val;
      if(intensity<=1.5){
			res = "I";	  
                }
                else if(intensity<=2.5){
                        res = "II";
				}
                else if(intensity<=3.5){
                         res = "III";
				} 
                else if(intensity<=4.5){
                         res = "IV";
				}
                else if(intensity<=5.5){
                      res = "V";
				}
                else if(intensity<=6.5){
                      res = "VI";
				}
                else if(intensity<=7.5){
                      res = "VII";
				}
                else if(intensity<=8.5){
                   res = "VIII";
				}
  				else if(intensity<=9.5){
                   res = "IX";
				}
				else if(intensity<=10.5){
                   res = "X";
				}
				else if(intensity>10.5){
				   res = "XI";
				}
      return res;
  }
  public String[] getDetails(){
     ArrayList<City> arr = new ArrayList<>();
	 String line = null;
	 
     try{
	    FileReader fileReader = new FileReader("C:\\\\Users\\\\hp\\\\Documents\\\\Web Applications\\\\IntensityCalculate\\\\src\\\\java\\\\CityModified.txt");
	    BufferedReader bufferedReader = new BufferedReader(fileReader);
		while((line = bufferedReader.readLine()) != null) {
		   String[] str = line.split("#");
		   String loc = str[0];
		   double lati = Double.parseDouble(str[1].substring(0,str[1].length()-2));
		   double longi = Double.parseDouble(str[2].substring(0,str[2].length()-2));
		   double intensity = calci(lati,longi);
		   City obj = new City(loc,lati,longi,intensity);
		   arr.add(obj);
		   //System.out.println(loc+"#"+lati+"#"+longi);
		}
     }
     catch(Exception e){
	    System.out.println(e);
     }
 	 Collections.sort(arr);
         String[] result = new String[5];
	 for(int i=0;i<arr.size();i++){
	    City c1 = arr.get(i);
		String det = c1.getDetails()+" "+Double.toString(c1.getIntensity());
                System.out.println(c1.getLati()+" "+c1.getLongi()+" "+det);
                
	 }
         for(int i=0;i<5;i++){
	    City c1 = arr.get(i);
		String det = c1.getDetails()+"   "+(getRoman(c1.getIntensity()));
                result[i]=det;
                
	 }
         return result;
  }
}