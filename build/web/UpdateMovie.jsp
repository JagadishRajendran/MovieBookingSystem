<%-- 
    Document   : index
    Created on : Nov 4, 2017, 5:39:28 PM
    Author     : JAGADISH
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Services.FetchMovieScreening"%>
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
                            <form action="Movie" method="post" class="login-form" enctype="multipart/form-data">
                                
                                
                                
                                <%
                                    StringBuffer displayBuf2= new StringBuffer();
                                    String movieId=request.getParameter("movieid");
                                    System.out.println("movieId--->"+movieId);
                                    MovieInfo mi=new MovieInfo();
                                    FetchMovieScreening ms=new FetchMovieScreening();
                                    mi.setMovieId(movieId);
                                    ResultSet rs=ms.fetchMoviedtls(mi);
                                    
                                    if(rs.next()){
                                        displayBuf2.append("<input type='text' placeholder='Movie Name' name='title' id='title' value='"+rs.getString("name")+"'/>");
                                        displayBuf2.append("<input type='text' placeholder='Director' name='director' id='director' value='"+rs.getString("director")+"'/>");
                                        displayBuf2.append("<input type='text' placeholder='Cast' name='cast' id='cast' value='"+rs.getString("cast")+"'/>");
                                        displayBuf2.append("<input type='textarea' placeholder='Description' name='description' id='description' value='"+rs.getString("description")+"'/>");
                                        displayBuf2.append("<input type='text' placeholder='Duration' name='duration' id='duration' value='"+rs.getString("duration")+"'/>");
                                        displayBuf2.append("<input type='file' name='file'> ");
                                        displayBuf2.append("<input type='hidden'  name='hidmovieid' id='hidmovieid' value='"+movieId+"'/>");
                                    //displayBuf2.append("<p class=/"message/">Not registered? <a href=/"#/">Create an account</a></p>");
                                    }
                                    out.println(displayBuf2);
                                %>
                                <input type='hidden'  name='hidoperation' id='hidoperation' value='update'/>
                                <input  type="submit" value="Submit" name="newmovie" />
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
