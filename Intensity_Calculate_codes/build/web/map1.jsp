<%-- 
    Document   : map1
    Created on : Jun 1, 2018, 4:59:27 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Intensity Map</title>
		<style>
       /* Set the size of the div element that contains the map */
      #map {
	    border: 7px solid black;
        float: left;
		height: 600px;  /* The height is 400 pixels */
        width: 60%;  /* The width is the width of the web page */
       }
	  #details{
	     background-color : #f1f1c1;
	     float : left;
	     height: 550px;
		 border: 0px solid white;
         padding: 35px;
		 width: 30%;
      }
      #space1{
	     height: 600px;
	     width : 2%;
      }
      body{
         background-color : #f1f1f1;
	  }	  
    </style>
	
	<script type="text/javascript">
      var map;
	  
      function toRadians (angle) {
          return angle * (Math.PI / 180);
	  }
	  function CalculateIntensity(longi,lati,magni,hei){
	     var res = [];
		 var x,y;
		 var r = 6371;
		 var lim=0;
		 
		        x = longi;
				y = lati;
		        var a = Math.sin(toRadians(90-y))*Math.sin(toRadians(90-lati));
				 var p = Math.cos(toRadians(x-longi));
				 var xi = Math.cos(toRadians(90-y))*Math.cos(toRadians(90-lati));
				 var di = Math.acos(xi+(a*p))*r;
				 var d = Math.sqrt(di*di + hei*hei);
				 var intensity = 6.15+1.13*magni-0.0006*d-3.12*Math.log10(d);
                			
				var store = String(x)+"#"+String(y)+"#"+String(intensity); 
				res[lim]=store;
				lim++;
		 
		 
		 return res;
	  }
	  function initMap() {
      
          map = new google.maps.Map(document.getElementById('map'), {
          zoom: 5,
          center: {lat:${Latitude}, lng:${Longitude}},
          mapTypeId: 'terrain'
          });
		  var res = CalculateIntensity(${Longitude},${Latitude},${Magnitude},${Height});
          var i=0;
		  var values = res[0].split("#");
		  r1 = values[2];
		  console.log(values[0]+" "+values[1]+" "+values[2]+" "+r1);
		  var heatMapData = [{location: new google.maps.LatLng(values[1],values[0]), weight:values[2]}];
		  var heatmap = new google.maps.visualization.HeatmapLayer({
           data: heatMapData,
		   dissipating : false,
		   gradient : [
             'rgba(255,255,255,0)',
			 'rgb(226,230,249)',
			 'rgb(193,207,253)',
			 'rgb(143,242,249)',
			 'rgb(118,253,170)',
			 'rgb(172,254,95)',
			 'rgb(231,252,40)',
			 'rgb(253,232,5)',
			 'rgb(248,213,0)',
			 'rgb(255,172,9)',
			 'rgb(255,150,4)',
			 'rgb(252,78,9)',
			 'rgb(229,2,4)',
			 'rgb(212,0,0)',
			 'rgb(201,1,8)',],
		   maxIntensity : 11.5
          });
          heatmap.setMap(map);
		  var myLatlng = new google.maps.LatLng(${Latitude},${Longitude});
		  var marker = new google.maps.Marker({
            position: myLatlng,
			icon : 'download_1.png',
            title:"Centre Point"
          });
          marker.setMap(map);
         
      }
	 
    </script>
    <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAgOSPWW4LXqZbeagborpzzZSt2rM-Tjrk&region=IN&libraries=visualization&callback=initMap">
    </script>
    </head>
     <body>
	 
	<div class="row">
	<div class="column" id="map"></div>
	   
	<div class="column" id="details">
	  <h1 style="color:purple"><u>Predicted Intensity Map:</u></h1>
	  <p>
	  <br><br>
	     Longitude : <font color="#3933FF"><b>${Longitude} N</b></font><br>
		 Latitude : <font color="#3933FF"><b>${Latitude} E</b></font><br>
		 Magnitude : <font color="#3933FF"><b>${Magnitude} </b></font><br>
		 Depth (km) : <font color="#3933FF"><b>${Height} </b></font><br>
		<script type="text/javascript">
		   
                var lati = ${Latitude};
				var longi = ${Longitude};
				var magni = ${Magnitude};
				var hei = ${Height};
				var r = 6373;
				/*
				var x = longi;
				var y = lati;
		        var latd = toRadians(lati-y);
			    var lond = toRadians(x-longi);
			    var a=Math.sin(latd/2)*Math.sin(latd/2)+Math.cos(toRadians(y))*Math.cos(toRadians(lati))*Math.sin(lond/2)*Math.sin(lond/2);
                var c=2*Math.atan2(Math.sqrt(a),Math.sqrt(1-a));
                var distance=r*c;
                var d=Math.sqrt(distance*distance+hei*hei);
                var intensity = 6.15+1.13*magni-0.0006*d-3.12*Math.log10(d);
				var res = intensity.toString();
				document.write("Calculated Intensity: "+res.substring(0,Math.min(res.length,10)));
				*/
		         var x = longi;
				 var y = lati;
				 var a = Math.sin(toRadians(90-y))*Math.sin(toRadians(90-lati));
				 var p = Math.cos(toRadians(x-longi));
				 var xi = Math.cos(toRadians(90-y))*Math.cos(toRadians(90-lati));
				 var di = Math.acos(xi+(a*p))*r;
				 var d = Math.sqrt(di*di + hei*hei);
				 var intensity = 6.15+1.13*magni-0.0006*d-3.12*Math.log10(d);
				 var res = intensity.toString();
				 document.write("Calculated Intensity: "+res.substring(0,Math.min(res.length,10)));
				/*
				if(intensity<=1.5){
				   //document.write("Calculated Intensity: "+res.substring(0,Math.min(res.length,10)).fontcolor("#C990E9"));
				   document.write("<br> Intensity Range: I (Not Felt)");
                }
                else if(intensity<=2.5){
                   //document.write("Calculated Intensity: "+res.substring(0,Math.min(res.length,10)).fontcolor("#90BEE9"));
				   document.write("<br> Intensity Range: II (Weak)");
				}
                else if(intensity<=3.5){
                   document.write("Calculated Intensity: "+res.substring(0,Math.min(res.length,10)).fontcolor("#90E9BD"));
				   document.write("<br> Intensity Range: III (Weak)");
				} 
                else if(intensity<=4.5){
                   //document.write("Calculated Intensity: "+res.substring(0,Math.min(res.length,10)).fontcolor("#90E9BD"));
				   document.write("<br> Intensity Range: IV (Light)");
				}
                else if(intensity<=5.5){
                   //document.write("Calculated Intensity: "+res.substring(0,Math.min(res.length,10)).fontcolor("#7DDC80"));
				   document.write("<br>Intensity Range: V (Moderate)");
				}
                else if(intensity<=6.5){
                   //document.write("Calculated Intensity: "+res.substring(0,Math.min(res.length,10)).fontcolor("#F8F229"));
				   document.write("<br> Intensity Range: VI (Strong)");
				}
                else if(intensity<=7.5){
                   //document.write("Calculated Intensity: "+res.substring(0,Math.min(res.length,10)).fontcolor("#F6C836"));
				   document.write("<br> Intensity Range: VII (Very Strong)");
				}
                else if(intensity<=8.5){
                   //document.write("Calculated Intensity: "+res.substring(0,Math.min(res.length,10)).fontcolor("#F69D32"));
				   document.write("<br> Intensity Range: VIII (Severe)");
				}
  				else if(intensity<=9.5){
                   //document.write("Calculated Intensity: "+res.substring(0,Math.min(res.length,10)).fontcolor("#ED6027"));
				   document.write("<br> Intensity Range: IX (Violent)");
				}
				else if(intensity<=10.5){
                   //document.write("Calculated Intensity: "+res.substring(0,Math.min(res.length,10)).fontcolor("#EB3315"));
				   document.write("<br> Intensity Range: X (Extreme)");
				}
				else if(intensity>10.5){
				   //document.write("Calculated Intensity: "+res.substring(0,Math.min(res.length,10)).fontcolor("#AE1C04"));
				   document.write("<br> Intensity Range: XI (Extreme)");
				}
				*/
        </script>
		<p>
		<b><u>Intensities at Nearby Cities:</u></b><br>
		1) <font color="#3933FF">${City1}</font><br>
		2) <font color="#3933FF">${City2}</font><br>
		3) <font color="#3933FF">${City3}</font><br>
		4) <font color="#3933FF">${City4}</font><br>
		5) <font color="#3933FF">${City5}</font><br>
		</p>
	  </p>
	  <br><br>
	  <p>
	    <b>Legend:</b>
		<p>
	    <img src = "legend.jpg" width = "350px" height="70px">
		</p>
	  </p>
	</div>
	</div>
	
    
  </body>
</html>
