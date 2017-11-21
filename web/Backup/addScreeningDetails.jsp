<%-- 
    Document   : index
    Created on : Nov 4, 2017, 5:39:28 PM
    Author     : JAGADISH
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Services.MovieDetails"%>
<%@page import="Bean.MovieInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css" type="text/css" />
        <title>JSP Page</title>
    </head>
    <body>
        <div id="wrapper">
            <div id="header">
                <ul id="mainnav">
                    <li class="current"><a href="#">Home</a></li>
                    <li><a href="#">Book Tickets</a></li>
                    <li><a href="#">Movies Playing</a></li>
                    <li><a href="#">My Booking</a></li>
                    <li><a href="#">My Account</a></li>
                    <li><a href="#">Contact Us</a></li>
                </ul>
            </div>
            <div id="content">
                <div id="rotator">
                        <div class="login-page">
                        <div class="form">
                            <form action="Screening" method="post" class="login-form">
                                
                                
                                <%
                                    StringBuffer displayBuf= new StringBuffer();
                                    String movieName = "";
                                    String movieIcon = "";
                                    int movieID;
                                    String screenName = "";
                                    int screenID;
                                    Date date = new Date();
                                    SimpleDateFormat simpDate=new SimpleDateFormat("hh:mm:ss a");
                                    
                                    MovieInfo mi = new MovieInfo();
                                    MovieDetails md = new MovieDetails();
                                    md.getMovieNamesIcon(mi);
                                    md.getScreeningDtls(mi);
                                    ResultSet rsMovie = mi.getAllMovieNamesIcon();
                                    ResultSet rsScreen = mi.getAllScreenNames();
                                    
                                    displayBuf.append("<select name='movie' id='movie'>");
                                    while (rsMovie.next()) {
                                        movieID = rsMovie.getInt("id");
                                        movieName = rsMovie.getString("name");
                                        movieIcon = rsMovie.getString("icon");
                                        //displayBuf.append("<a>" + movieID + "  " + movieName + "  " + movieIcon + "</a><br>");
                                        displayBuf.append("<option value='" + movieID + "'>" + movieName + "</option>");
                                    }
                                    displayBuf.append("</select><br><select name='screen' id='screen'>");
                                    while (rsScreen.next()) {
                                        screenID = rsScreen.getInt("id");
                                        screenName = rsScreen.getString("name");
                                        //displayBuf.append("<a>" + screenID + "  " + screenName + "</a><br>");
                                        displayBuf.append("<option value='" + screenID + "'>" + screenName + "</option>");
                                    }
                                    displayBuf.append("</select>");
                                    displayBuf.append("<input type='date' name='screendate' id='screendate'>");
                                    displayBuf.append("<select name='time' id='time'>");
                                    displayBuf.append("<option value='10:00 AM'>10:00 AM</option>");
                                    displayBuf.append("<option value='1:00 PM'>1:00 PM</option>");
                                    displayBuf.append("<option value='4:00 PM'>4:00 PM</option>");
                                    displayBuf.append("<option value='6:00 PM'>6:00 PM</option>");
                                    displayBuf.append("<option value='10:00 PM'>10:00 PM</option>");
                                    displayBuf.append("<select/>");
                                    displayBuf.append("<input type='hidden'  name='hidoperation' id='hidoperation' value='login'/>");
                                    displayBuf.append("<button>Submit</button>");
                                    //displayBuf2.append("<p class=/"message/">Not registered? <a href=/"#/">Create an account</a></p>");
                                    
                                    out.println(displayBuf);
                                %>
                                <p class="message">Not registered? <a href="#">Create an account</a></p>
                            </form>
                            
                        </div>
                    </div>
            </div>
        </div>
  
        <div id="featured">
            <h1>Online Movie Ticket Reservation system<a href="#"></a></h1>
        </div>

        <div id="footer">
        <h4><p>&copy; Copyright 2017 SANJ  All Rights Reserved <br /></p></h4>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="js/animate.js"></script>
    </body>
</html>
