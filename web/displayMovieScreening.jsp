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
        <link rel="stylesheet" href="css/style.css" type="text/css" />
        <title>JSP Page</title>
    </head>
    <body>
        <div id="wrapper">
            
            
                            <form action="Movie" method="post" class="login-form" enctype="multipart/form-data">
                                <table style="width:100%">
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
                                            displayBuf.append("<td>"+rs.getString("director")+"</td>");
                                            displayBuf.append("<td>"+rs.getString("screen_name")+"</td>");
                                            displayBuf.append("<td>"+rs.getDate("screening_date")+"</td>");
                                            displayBuf.append("<td>"+rs.getString("screening_time")+"</td>");
                                            displayBuf.append("<td>"+"<a href=\"/MovieBookingSystem/UpdateMovie.jsp?movieid="+rs.getString("movie_id")+"&screening_id="+rs.getString("screening_id")+"\">Update</a>"+"</td>");
                                            displayBuf.append("<td>"+"<a href=\"/MovieBookingSystem/DeleteMovieScreening?movieid="+rs.getString("movie_id")+"&screening_id="+rs.getString("screening_id")+"\">Delete</a>"+"</td></tr>");
                                        }
                                        out.println(displayBuf);
                                    %>    
                                </table>
                            </form>             
        </div>
  

    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="js/animate.js"></script>
    </body>
</html>
