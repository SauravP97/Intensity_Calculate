<%-- 
    Document   : index1
    Created on : Jun 21, 2018, 1:13:25 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Intensity Predict</title>
		<title>IMD Front</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
    box-sizing: border-box;
}

body {
    font-family: Arial, Helvetica, sans-serif;
}

/* Style the header */
header {
    background-color: #666;
    padding: 5px;
	height : 100px;
    text-align: center;
    font-size: 25px;
    color: white;
}

/* Create two columns/boxes that floats next to each other */
nav {
    float: left;
    width: 30%;
    height: 500px; /* only for demonstration, should be removed */
    background: #ccc;
    padding: 20px;
}

/* Style the list inside the menu */
nav ul {
    list-style-type: none;
    padding: 0;
}

article {
    float: left;
    padding: 20px;
    width: 70%;
    background-color: #f1f1f1;
    height: 500px; /* only for demonstration, should be removed */
}

/* Clear floats after the columns */
section:after {
    content: "";
    display: table;
    clear: both;
}



/* Responsive layout - makes the two columns/boxes stack on top of each other instead of next to each other, on small screens */
@media (max-width: 600px) {
    nav, article {
        width: 100%;
        height: auto;
    }
}
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 15px;
    text-align: left;
}
table#t01 {
    width: 100%;    
    background-color: #f1f1c1;
}
</style>
    </head>
	
    <body>
    <%@ page import="java.io.*" %>
	<%
		  
		  File file = new File("C:\\\\Users\\\\hp\\\\Documents\\\\Web Applications\\\\IntensityCalculate\\\\src\\\\java\\\\EQData.txt"); 
          BufferedReader br = new BufferedReader(new FileReader(file));
          String st;
		  String[][] str = new String[10][7];
          int ch=0;
		  while((st = br.readLine()) != null){
              String[] lin = st.split("#");
			  str[ch][0] = lin[0];
			  str[ch][1] = lin[1];
			  str[ch][2] = lin[2];
			  str[ch][3] = lin[3];
			  str[ch][4] = lin[4];
			  str[ch][5] = lin[5];
			  str[ch][6] = lin[6];
			  ch++;
			  if(ch==10){
			    break;
			  }
          }
		  while(ch<10){
		      str[ch][0] = "";
			  str[ch][1] = "";
			  str[ch][2] = "";
			  str[ch][3] = "";
			  str[ch][4] = "";
			  str[ch][5] = "";
			  str[ch][6] = "";
			  ch++;
		  }
	%>
	
<header>
  <h2>Indian Meteorological Department <img src="IMD_LOGO.png" width="50" height="60" align="right"></h2>
  
</header>

<section>
  <nav> 
   <br><br><br>
   <form action="Calculate">
  <fieldset>
    <legend><b>Earthquake information:</b></legend>
	Date (YYYY-MM-DD):<br>
    <input type="text" name="date" ><br>
	Time UTC (HH:MM:SS):<br>
    <input type="text" name="utc" ><br>
    Latitude:<br>
    <input type="text" name="lat" ><br>
    Longitude:<br>
    <input type="text" name="long" ><br>
	Magnitude:<br>
    <input type="text" name="mag" ><br>
	Height:<br>
    <input type="text" name="heig" ><br><br>
    <input type="submit" value="Calculate">
  </fieldset>
  <br>
  <p>
  </form>
   <form action="ReadFile">
  <fieldset>
    <legend><b>Read from File:</b></legend>
    <input type="submit" value="Read">
  </fieldset>
  </form>  
  </p>
  </nav>
  
  <article>
     <table id="t01">
     <tr>
       <th>Date</th>
	   <th>Time ITC</th>
       <th>Time UTC</th> 
       <th>Latitude</th>
	   <th>Longitude</th>
	   <th>Magnitude</th>
	   <th>Depth</th>
     </tr>
     <tr>
       <td><%=str[0][0]%></</td>
       <td><%=str[0][1]%></</td> 
       <td><%=str[0][2]%></td>
	   <td><%=str[0][3]%></td>
	   <td><%=str[0][4]%></td>
	   <td><%=str[0][5]%></td>
	   <td><%=str[0][6]%></td>
     </tr>
	 <tr>
       <td><%=str[1][0]%></td>
       <td><%=str[1][1]%></td> 
       <td><%=str[1][2]%></td>
	   <td><%=str[1][3]%></td>
	   <td><%=str[1][4]%></td>
	   <td><%=str[1][5]%></td>
	   <td><%=str[1][6]%></td>
     </tr>
	 <tr>
       <td><%=str[2][0]%></td>
       <td><%=str[2][1]%></td> 
       <td><%=str[2][2]%></td>
	   <td><%=str[2][3]%></td>
	   <td><%=str[2][4]%></td>
	   <td><%=str[2][5]%></td>
	   <td><%=str[2][6]%></td>
     </tr>
	 <tr>
       <td><%=str[3][0]%></td>
       <td><%=str[3][1]%></td> 
       <td><%=str[3][2]%></td>
	   <td><%=str[3][3]%></td>
	   <td><%=str[3][4]%></td>
	   <td><%=str[3][5]%></td>
	   <td><%=str[3][6]%></td>
     </tr>
	 <tr>
       <td><%=str[4][0]%></td>
       <td><%=str[4][1]%></td> 
       <td><%=str[4][2]%></td>
	   <td><%=str[4][3]%></td>
	   <td><%=str[4][4]%></td>
	   <td><%=str[4][5]%></td>
	   <td><%=str[4][6]%></td>
     </tr>
	 <tr>
       <td><%=str[5][0]%></td>
       <td><%=str[5][1]%></td> 
       <td><%=str[5][2]%></td>
	   <td><%=str[5][3]%></td>
	   <td><%=str[5][4]%></td>
	   <td><%=str[5][5]%></td>
	   <td><%=str[5][6]%></td>
     </tr>
	 <tr>
       <td><%=str[6][0]%></td>
       <td><%=str[6][1]%></td> 
       <td><%=str[6][2]%></td>
	   <td><%=str[6][3]%></td>
	   <td><%=str[6][4]%></td>
	   <td><%=str[6][5]%></td>
	   <td><%=str[6][6]%></td>
     </tr>
	 <tr>
       <td><%=str[7][0]%></td>
       <td><%=str[7][1]%></td> 
       <td><%=str[7][2]%></td>
	   <td><%=str[7][3]%></td>
	   <td><%=str[7][4]%></td>
	   <td><%=str[7][5]%></td>
	   <td><%=str[7][6]%></td>
     </tr>
	 <tr>
       <td><%=str[8][0]%></td>
       <td><%=str[8][1]%></td> 
       <td><%=str[8][2]%></td>
	   <td><%=str[8][3]%></td>
	   <td><%=str[8][4]%></td>
	   <td><%=str[8][5]%></td>
	   <td><%=str[8][6]%></td>
     </tr>
	 
    </table>
  </article>
</section>
    </body>
</html>
