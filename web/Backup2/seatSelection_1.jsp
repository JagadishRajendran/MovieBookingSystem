<%--
    Document   : displaymovies
    Created on : Nov 7, 2017, 2:40:28 PM
    Author     : Jagadish
--%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Bean.MovieInfo"%>
<%@page import="Services.MovieDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <link rel='stylesheet prefetch' href='https://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css'>
        <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Poiret+One'>
        <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'>
        <link rel='stylesheet prefetch' href='https://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap-theme.min.css'>
        <script src='https://code.jquery.com/jquery-1.10.1.min.js'></script>
        <script src='https://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js'></script>
        <script src="js/Movie.js"></script>
  <title>Seat Page</title>
  <style type="text/css">
  body
  {
    background-color:#141311;
    color:#d75813;
  }
  * {
    margin: 0;
    padding: 0;

}

.seat {
    float: right;
    display: block;
    margin: 50px 5px 5px 5px;
    background: #808080;
    width: 50px;
    height: 50px;
}

.seat-select {
    display: none;

}
.seat-select-block {
    display: none;

}
.seat-select-block:disabled+.seat{
    background: #0000FF;
}

.seat-select:checked+.seat {
    /*background: #F44336;*/
    background: #4CAF50;
}
.checkbox-grid li {
    display: block;
    float: left;
    width: 10%;
    margin: 10px;
}
  .movie {
  margin: 120px auto;
  max-width: 1000px;
}
 .screen {
   height:60px; 
   position: relative;
   overflow: hidden;
   text-align: center;
   border-bottom: 5px solid #d8d8d8;
   &:before {
     content: "";
     display: block;
     position: absolute;
     top: 0;
     left: 0;
     height: 500px;
     width: 100%;
     border-radius: 50%;
     border-right: 5px solid #d8d8d8;
     border-left: 5px solid #d8d8d8;
   }
   h1 {
     width: 60%;
     margin: 100px auto 35px auto;
   }
 }

 #position{
  margin-top: 100px;
 }
 #submit-button{
  margin: 50px 50px 50px 50px;
  float: right;
 }
 #butt-style{
     margin: 0px;
     position: absolute;
     bottom: 110px;
     left: 1200px;
 }
  </style>

</head>
<body>

 <div class="container">
    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand" href="#">Seat Booking</a>
        </div>
      </div>
    </div>
  </div>

    <div class="container">
<div class="movie">
  <div class="screen">
    <h3>Screen here</h3>
  </div>
  <div id="position">
  <ul class="checkbox-grid">
    <form id="reservation" action='ShowSeats' method="post" action=".jsp">
      <section id="seats">
        <%
            int movieID;
            int screeningID;
            StringBuffer displayBuf2 = new StringBuffer();
            MovieDetails md = new MovieDetails();
            MovieInfo movieInfo=new MovieInfo();
            HashMap<String, Integer> hmap = new HashMap<String, Integer>();
            HttpSession s = request.getSession();
            movieID = Integer.parseInt(s.getAttribute("movieID").toString());
            screeningID = Integer.parseInt(s.getAttribute("screeningID").toString());
            


            movieInfo.setMovieId(Integer.toString(movieID));
            movieInfo.setScreeningId(Integer.toString(screeningID));
            ResultSet selectedSeatsRS=md.getSelectedSeat(movieInfo);
            while(selectedSeatsRS.next()){
                hmap.put(selectedSeatsRS.getString("seat"),selectedSeatsRS.getInt("status"));
            }    
            displayBuf2.append("<input type='hidden'  name='hidmovieid' id='hidmovieid' value='"+movieID+"'/>");
            displayBuf2.append("<input type='hidden'  name='hidscreeningid' id='hidscreeningid' value='"+screeningID+"'/>");
            if(hmap.containsKey("A1") && (hmap.get("A1")==1)){ 
                
                displayBuf2.append("<li><input id='A1' class=\"seat-select-block\" disabled  type='checkbox' value='A1' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='A1' class=\"seat-select\" onclick='selectseat(\"A1\")' type='checkbox' value='A1' name='seat[]' />");
            }
            displayBuf2.append("<label for='A1' class='seat'>A1</label></li>");
            if(hmap.containsKey("A2") && (hmap.get("A2")==1)){ 
                
                displayBuf2.append("<li><input id='A2' class=\"seat-select-block\" disabled  type='checkbox' value='A2' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='A2' class=\"seat-select\" onclick='selectseat(\"A2\")' type='checkbox' value='A2' name='seat[]' />");
            }
            displayBuf2.append("<label for='A2' class='seat'>A2</label></li>");
            if(hmap.containsKey("A3") && (hmap.get("A3")==1)){ 
                
                displayBuf2.append("<li><input id='A3' class=\"seat-select-block\" disabled  type='checkbox' value='A3' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='A3' class=\"seat-select\" onclick='selectseat(\"A3\")' type='checkbox' value='A3' name='seat[]' />");
            }
            displayBuf2.append("<label for='A3' class='seat'>A3</label></li>");
            if(hmap.containsKey("A4") && (hmap.get("A4")==1)){ 
                
                displayBuf2.append("<li><input id='A4' class=\"seat-select-block\" disabled  type='checkbox' value='A4' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='A4' class=\"seat-select\" onclick='selectseat(\"A4\")' type='checkbox' value='A4' name='seat[]' />");
            }
            displayBuf2.append("<label for='A4' class='seat'>A4</label></li>");
            if(hmap.containsKey("A5") && (hmap.get("A5")==1 || hmap.get("A5")==2)){ 
                
                displayBuf2.append("<li><input id='A5' class=\"seat-select-block\" disabled  type='checkbox' value='A5' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='A5' class=\"seat-select\" onclick='selectseat(\"A5\")' type='checkbox' value='A5' name='seat[]' />");
            }
            displayBuf2.append("<label for='A5' class='seat'>A5</label></li>");
            if(hmap.containsKey("A6") && (hmap.get("A6")==1 || hmap.get("A6")==2)){ 
                
                displayBuf2.append("<li><input id='A6' class=\"seat-select-block\" disabled  type='checkbox' value='A6' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='A6' class=\"seat-select\" onclick='selectseat(\"A6\")' type='checkbox' value='A6' name='seat[]' />");
            }
            displayBuf2.append("<label for='A6' class='seat'>A6</label></li>");
            if(hmap.containsKey("A7") && (hmap.get("A7")==1 || hmap.get("A7")==2)){ 
                
                displayBuf2.append("<li><input id='A7' class=\"seat-select-block\" disabled  type='checkbox' value='A7' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='A7' class=\"seat-select\" onclick='selectseat(\"A7\")' type='checkbox' value='A7' name='seat[]' />");
            }
            displayBuf2.append("<label for='A7' class='seat'>A7</label></li>");
            if(hmap.containsKey("A8") && (hmap.get("A8")==1 || hmap.get("A8")==2)){ 
                
                displayBuf2.append("<li><input id='A8' class=\"seat-select-block\" disabled  type='checkbox' value='A8' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='A8' class=\"seat-select\" onclick='selectseat(\"A8\")' type='checkbox' value='A8' name='seat[]' />");
            }
            displayBuf2.append("<label for='A8' class='seat'>A8</label></li>");
            
            
            
            if(hmap.containsKey("B1") && (hmap.get("B1")==1 || hmap.get("B1")==2)){ 
                
                displayBuf2.append("<li><input id='B1' class=\"seat-select-block\" disabled  type='checkbox' value='B1' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='B1' class=\"seat-select\" onclick='selectseat(\"B1\")' type='checkbox' value='B1' name='seat[]' />");
            }
            displayBuf2.append("<label for='B1' class='seat'>B1</label></li>");
            if(hmap.containsKey("B2") && (hmap.get("B2")==1 || hmap.get("B2")==2)){ 
                
                displayBuf2.append("<li><input id='B2' class=\"seat-select-block\" disabled  type='checkbox' value='B2' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='B2' class=\"seat-select\" onclick='selectseat(\"B2\")' type='checkbox' value='B2' name='seat[]' />");
            }
            displayBuf2.append("<label for='B2' class='seat'>B2</label></li>");
            if(hmap.containsKey("B3") && (hmap.get("B3")==1 || hmap.get("B3")==2)){ 
                
                displayBuf2.append("<li><input id='B3' class=\"seat-select-block\" disabled  type='checkbox' value='B3' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='B3' class=\"seat-select\" onclick='selectseat(\"B3\")' type='checkbox' value='B3' name='seat[]' />");
            }
            displayBuf2.append("<label for='B3' class='seat'>B3</label></li>");
            if(hmap.containsKey("B4") && (hmap.get("B4")==1 || hmap.get("B4")==2)){ 
                
                displayBuf2.append("<li><input id='B4' class=\"seat-select-block\" disabled  type='checkbox' value='B4' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='B4' class=\"seat-select\" onclick='selectseat(\"B4\")' type='checkbox' value='B4' name='seat[]' />");
            }
            displayBuf2.append("<label for='B4' class='seat'>B4</label></li>");
            if(hmap.containsKey("B5") && (hmap.get("B5")==1 || hmap.get("B5")==2)){ 
                
                displayBuf2.append("<li><input id='B5' class=\"seat-select-block\" disabled  type='checkbox' value='B5' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='B5' class=\"seat-select\" onclick='selectseat(\"B5\")' type='checkbox' value='B5' name='seat[]' />");
            }
            displayBuf2.append("<label for='B5' class='seat'>B5</label></li>");
            if(hmap.containsKey("B6") && (hmap.get("B6")==1 || hmap.get("B6")==2)){ 
                
                displayBuf2.append("<li><input id='B6' class=\"seat-select-block\" disabled  type='checkbox' value='B6' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='B6' class=\"seat-select\" onclick='selectseat(\"B6\")' type='checkbox' value='B6' name='seat[]' />");
            }
            displayBuf2.append("<label for='B6' class='seat'>B6</label></li>");
            if(hmap.containsKey("B7") && (hmap.get("B7")==1 || hmap.get("B7")==2)){ 
                
                displayBuf2.append("<li><input id='B7' class=\"seat-select-block\" disabled  type='checkbox' value='B7' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='B7' class=\"seat-select\" onclick='selectseat(\"B7\")' type='checkbox' value='B7' name='seat[]' />");
            }
            displayBuf2.append("<label for='B7' class='seat'>B7</label></li>");
            if(hmap.containsKey("B8") && (hmap.get("B8")==1 || hmap.get("B8")==2)){ 
                
                displayBuf2.append("<li><input id='B8' class=\"seat-select-block\" disabled  type='checkbox' value='B8' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='B8' class=\"seat-select\" onclick='selectseat(\"B8\")' type='checkbox' value='B8' name='seat[]' />");
            }
            displayBuf2.append("<label for='B8' class='seat'>B8</label></li>");
            
            
            if(hmap.containsKey("C1") && (hmap.get("C1")==1 || hmap.get("C1")==2)){ 
                
                displayBuf2.append("<li><input id='C1' class=\"seat-select-block\" disabled  type='checkbox' value='C1' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='C1' class=\"seat-select\" onclick='selectseat(\"C1\")' type='checkbox' value='C1' name='seat[]' />");
            }
            displayBuf2.append("<label for='C1' class='seat'>C1</label></li>");
            if(hmap.containsKey("C2") && (hmap.get("C2")==1 || hmap.get("C2")==2)){ 
                
                displayBuf2.append("<li><input id='C2' class=\"seat-select-block\" disabled  type='checkbox' value='C2' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='C2' class=\"seat-select\" onclick='selectseat(\"C2\")' type='checkbox' value='C2' name='seat[]' />");
            }
            displayBuf2.append("<label for='C2' class='seat'>C2</label></li>");
            if(hmap.containsKey("C3") && (hmap.get("C3")==1 || hmap.get("C3")==2)){ 
                
                displayBuf2.append("<li><input id='C3' class=\"seat-select-block\" disabled  type='checkbox' value='C3' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='C3' class=\"seat-select\" onclick='selectseat(\"C3\")' type='checkbox' value='C3' name='seat[]' />");
            }
            displayBuf2.append("<label for='C3' class='seat'>C3</label></li>");
            if(hmap.containsKey("C4") && (hmap.get("C4")==1 || hmap.get("C4")==2)){ 
                
                displayBuf2.append("<li><input id='C4' class=\"seat-select-block\" disabled  type='checkbox' value='C4' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='C4' class=\"seat-select\" onclick='selectseat(\"C4\")' type='checkbox' value='C4' name='seat[]' />");
            }
            displayBuf2.append("<label for='C4' class='seat'>C4</label></li>");
            if(hmap.containsKey("C5") && (hmap.get("C5")==1 || hmap.get("C5")==2)){ 
                
                displayBuf2.append("<li><input id='C5' class=\"seat-select-block\" disabled  type='checkbox' value='C5' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='C5' class=\"seat-select\" onclick='selectseat(\"C5\")' type='checkbox' value='C5' name='seat[]' />");
            }
            displayBuf2.append("<label for='C5' class='seat'>C5</label></li>");
            if(hmap.containsKey("C6") && (hmap.get("C6")==1 || hmap.get("C6")==2)){ 
                
                displayBuf2.append("<li><input id='C6' class=\"seat-select-block\" disabled  type='checkbox' value='C6' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='C6' class=\"seat-select\" onclick='selectseat(\"C6\")' type='checkbox' value='C6' name='seat[]' />");
            }
            displayBuf2.append("<label for='C6' class='seat'>C6</label></li>");
            if(hmap.containsKey("C7") && (hmap.get("C7")==1 || hmap.get("C7")==2)){ 
                
                displayBuf2.append("<li><input id='C7' class=\"seat-select-block\" disabled  type='checkbox' value='C7' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='C7' class=\"seat-select\" onclick='selectseat(\"C7\")' type='checkbox' value='C7' name='seat[]' />");
            }
            displayBuf2.append("<label for='C7' class='seat'>C7</label></li>");
            if(hmap.containsKey("C8") && (hmap.get("C8")==1 || hmap.get("C8")==2)){ 
                
                displayBuf2.append("<li><input id='C8' class=\"seat-select-block\" disabled  type='checkbox' value='C8' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='C8' class=\"seat-select\" onclick='selectseat(\"C8\")' type='checkbox' value='C8' name='seat[]' />");
            }
            displayBuf2.append("<label for='C8' class='seat'>C8</label></li>");
            displayBuf2.append("<div id='butt-style'><input class='btn btn-info pull-right' type='submit' value='Select Seat'></div>");
            out.println(displayBuf2); 
      %>
    </section>
    </form>
    <br> <br> <br> <br> <br> <br><br><br> <br> <br> <br> <br> <br><br><br> <br><br><br> <br><br>
    <a class='btn btn-info'type='button'href='DisplayMovieInfo.jsp'>Back</a>
<!--    <input class='btn btn-info pull-right' type='submit' value='Select Seat'>-->
    </ul>
  </div>
  
 
  
  </div>
</div>
</body>
</html>

