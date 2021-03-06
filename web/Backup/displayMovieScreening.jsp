<%-- 
    Document   : index
    Created on : Nov 4, 2017, 5:39:28 PM
    Author     : JAGADISH
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Services.FetchMovieScreening"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>admin</title>
        <link rel='stylesheet prefetch' href='https://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css'>
        <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Poiret+One'>
        <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'>
        <link rel='stylesheet prefetch' href='https://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap-theme.min.css'>
        <script src='https://code.jquery.com/jquery-1.10.1.min.js'></script>
        <script src='https://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js'></script>
    <style type="text/css" media="screen">
        body {
          padding-top: 80px;
          background-color:#141311;
          color:#d75813;
        }
    </style>
    </head>
    <body>
        <div class="container">
    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand" href="#">ADMIN</a>
        </div>
      </div>
    </div>
  </div>
        <br>
	<div class="container">
	  <ul class="nav nav-tabs">
	    <li style="font-size:150%"class="active"><a href="#">Home</a></li>
	    <li><a style="font-size:150%" href="#">Insert Movies</a></li>
	    <li><a style="font-size:150%" href="#">Screening Time</a></li>
	    <li><a style="font-size:150%" href="#">Food</a></li>
  	  </ul>
        <br>
  
        </div>
            <div class="container">
                            <form action="Movie" method="post" class="login-form" enctype="multipart/form-data">
                            <font size="5">
                            <table id="table-control" class="table table-bordered">                                
                                    <tr>
                                      <th>Movie Name</th>
                                      <th>Director</th> 
                                      <th>Screen Name</th>
                                      <th>Screen Date</th>
                                      <th>Screen Time</th>
                                      <th>Modify</th>
                                      <th>Delete</th>
                                    </tr>
                                    <%
                                        StringBuffer displayBuf= new StringBuffer();
                                        FetchMovieScreening ms=new FetchMovieScreening();
                                        ResultSet rs=ms.fetchMovieInfo();
                                        while(rs.next()){
                                            displayBuf.append("<tr><td>"+rs.getString("movie_name")+"</td>");
                                            displayBuf.append("<td >"+rs.getString("director")+"</td>");
                                            displayBuf.append("<td>"+rs.getString("screen_name")+"</td>");
                                            displayBuf.append("<td>"+rs.getDate("screening_date")+"</td>");
                                            displayBuf.append("<td>"+rs.getString("screening_time")+"</td>");
                                            displayBuf.append("<td>"+"<a href=\"/MovieBookingSystem/UpdateMovie.jsp?movieid="+rs.getString("movie_id")+"&screening_id="+rs.getString("screening_id")+"\">Update</a>"+"</td>");
                                            displayBuf.append("<td>"+"<a href=\"/MovieBookingSystem/DeleteMovieScreening?movieid="+rs.getString("movie_id")+"&screening_id="+rs.getString("screening_id")+"\">Delete</a>"+"</td></tr>");
                                        }
                                        out.println(displayBuf);
                                    %>    
                                </table>
                                </font>
                            </form>             
<!--        </div>-->
  

    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="js/animate.js"></script>
    </body>
</html>
