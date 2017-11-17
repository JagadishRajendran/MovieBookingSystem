<%--
    Document   : DisplayMovieInfo
    Created on : Nov 10, 2017, 6:09:54 PM
    Author     : nithi
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Services.MovieDetails"%>
<%@page import="Bean.MovieInfo"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Info</title>
    </head>
    <body>
        <div id="wrapper">
            <div id="content">
                <div id="rotator">
                    <div class="displaymovieinfo-page">
                        <div class="form">
                            <form action="DisplayMovieInfo" method="post" class="displaymovieinfo-form">

                                <%
                                    int movieID;
                                    MovieDetails md = new MovieDetails();
                                    HttpSession s = request.getSession();
                                    movieID = Integer.parseInt(s.getAttribute("movieID").toString());
                                    ResultSet rs = md.getMovieInfo(movieID);
                                    rs.next();
                                    StringBuffer displayBuf2 = new StringBuffer();
                                    displayBuf2.append("<input type='hidden'  name='screenmovieid' id='screenmovieid' value='" + movieID + "'/>");
                                    displayBuf2.append("<p>");
                                    displayBuf2.append("<br>Movie &nbsp: " + rs.getString("name"));
                                    displayBuf2.append("<br>Director &nbsp: " + rs.getString("director"));
                                    displayBuf2.append("<br>Cast &nbsp: " + rs.getString("cast"));
                                    displayBuf2.append("<br>Duration &nbsp: " + rs.getInt("duration"));
                                    displayBuf2.append("<br>Description &nbsp: " + rs.getString("description"));
                                    displayBuf2.append("</p>");
                                    
                                    displayBuf2.append("Rating:<select name='rating' id='rating'>");
                                    displayBuf2.append("<option value='1'>1</option>");
                                    displayBuf2.append("<option value='2'>2</option>");
                                    displayBuf2.append("<option value='3'>3</option>");
                                    displayBuf2.append("<option value='4'>4</option>");
                                    displayBuf2.append("<option value='5'>5</option>");
                                    displayBuf2.append("<select/><br>");
                                    displayBuf2.append("<input type='textarea' placeholder='Comments' name='screendate' id='screendate'><br>");
                                    displayBuf2.append("<button>Submit Review</button>");
                                    displayBuf2.append("<button>Show Screenings</button>");
                                    
                                    
                                    
                                    out.println(displayBuf2);
                                %>
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
    </body>
</html>
