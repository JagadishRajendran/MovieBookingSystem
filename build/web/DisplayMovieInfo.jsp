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
        <script src="js/Movie.js"></script>
    </head>
    <body>
        
        <form id='DisplayMovieInfo' action="DisplayMovieInfo" method="post" >

            <%
                int movieID;
                MovieDetails md = new MovieDetails();
                HttpSession s = request.getSession();
                movieID = Integer.parseInt(s.getAttribute("movieID").toString());
                System.out.println("movieID--->"+movieID);
                ResultSet rs = md.getMovieInfo(movieID);
                StringBuffer displayBuf1 = new StringBuffer();
                if(rs.next()){
                    displayBuf1.append("<input type='hidden'  name='screenmovieid' id='screenmovieid' value='" + movieID + "'/>");
                    displayBuf1.append("<p>");
                    displayBuf1.append("<br>Movie &nbsp: " + rs.getString("name"));
                    displayBuf1.append("<br>Director &nbsp: " + rs.getString("director"));
                    displayBuf1.append("<br>Cast &nbsp: " + rs.getString("cast"));
                    displayBuf1.append("<br>Duration &nbsp: " + rs.getInt("duration"));
                    displayBuf1.append("<br>Description &nbsp: " + rs.getString("description"));
                    displayBuf1.append("</p>");
                }
                displayBuf1.append("<input type='button' onclick='form2Submit()' class='btn btn-info' value='Show Screenings'><br>");

                    
                out.println(displayBuf1);

            %>
        </form>
        <form id='UpdateMovieReview' action="UpdateMovieReview" method="post" >
            <%
                StringBuffer displayBuf2 = new StringBuffer();
                int userID=Integer.parseInt(session.getAttribute("userId").toString() );
                MovieInfo movieInfo=new MovieInfo();
                movieInfo.setMovieId( Integer.toString(movieID));
                movieInfo.setUserId(Integer.toString(userID));
                ResultSet reviewRS = md.getMovieReview(movieInfo);


                displayBuf2.append("<input type='hidden'  name='movieid' id='movieid' value='" + movieID + "'/>");
                displayBuf2.append("<input type='hidden'  name='userid' id='userid' value='" + userID + "'/>");
                if(reviewRS.next()){
                    displayBuf2.append("<input type='hidden'  name='operation' id='operation' value='update'/>");
                    displayBuf2.append("Rating:<p>"+reviewRS.getInt("rating")+"</p>");
                    displayBuf2.append("<input type='textarea' placeholder='Comments' name='comments' id='comments' value='"+reviewRS.getString("comments")+"'><br>");
                }
                else{
                    displayBuf2.append("<input type='hidden'  name='operation' id='operation' value='insert'/>");
                    displayBuf2.append("Rating:<select name='rating' id='rating'>");
                    displayBuf2.append("<option value='1'>1</option>");
                    displayBuf2.append("<option value='2'>2</option>");
                    displayBuf2.append("<option value='3'>3</option>");
                    displayBuf2.append("<option value='4'>4</option>");
                    displayBuf2.append("<option value='5'>5</option>");
                    displayBuf2.append("<select/><br>");
                    displayBuf2.append("<input type='textarea' placeholder='Comments' name='comments' id='comments'><br>");
                }
                displayBuf2.append("<input type='button' onclick='form1Submit()' class='btn btn-info' value='Show Screenings'><br>");
                out.println(displayBuf2);
            %>
        </form>    
    </body>
</html>
