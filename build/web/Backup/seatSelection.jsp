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
            if(hmap.containsKey("A1") && (hmap.get("A1")==1 || hmap.get("A1")==2)){ 
                
                displayBuf2.append("<li><input id='A1' class=\"seat-select-block\" disabled  type='checkbox' value='A1' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='A1' class=\"seat-select\" onclick='selectseat(\"A1\")' type='checkbox' value='A1' name='seat[]' />");
            }
            displayBuf2.append("<label for='A1' class='seat'>A1</label></li>");
            if(hmap.containsKey("A2") && (hmap.get("A2")==1 || hmap.get("A2")==2)){ 
                
                displayBuf2.append("<li><input id='A2' class=\"seat-select-block\" disabled  type='checkbox' value='A2' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='A2' class=\"seat-select\" onclick='selectseat(\"A2\")' type='checkbox' value='A2' name='seat' />");
            }
            displayBuf2.append("<label for='A2' class='seat'>A2</label></li>");
            if(hmap.containsKey("A3") && (hmap.get("A3")==1 || hmap.get("A3")==2)){ 
                
                displayBuf2.append("<li><input id='A3' class=\"seat-select-block\" disabled  type='checkbox' value='A3' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='A3' class=\"seat-select\" onclick='selectseat(\"A3\")' type='checkbox' value='A3' name='seat' />");
            }
            displayBuf2.append("<label for='A3' class='seat'>A3</label></li>");
            if(hmap.containsKey("A4") && (hmap.get("A4")==1 || hmap.get("A4")==2)){ 
                
                displayBuf2.append("<li><input id='A4' class=\"seat-select-block\" disabled  type='checkbox' value='A4' name='seat[]' />");
            }
            else{
                displayBuf2.append("<li><input id='A4' class=\"seat-select\" onclick='selectseat(\"A4\")' type='checkbox' value='A4' name='seat' />");
            }
            displayBuf2.append("<label for='A4' class='seat'>A4</label></li>");
            displayBuf2.append("<input type='submit' value='Book Now'>");
            out.println(displayBuf2); 
      %>
    </section>
    </form>
    </ul>
  </div>
  
  <div id='submit-button'>
  <a class='btn btn-large btn-info' href='food.html'>Continue</a>
  </div>
  
  </div>

   <script type="text/javascript">
    console.log("shit");
    if()
  $("#A").prop("checked", true);
  // document.getElementById("checkbox").checked = true;
  </script>
</body>
</html>

