<%@page import="java.sql.ResultSet"%>
<%@page import="Services.MovieDetails"%>
<%@page import="Bean.MovieInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Screens</title>
    </head>
    <body>
        <div id="wrapper">
            <div id="content">
                <div id="rotator">
                    <div class="screeninginfo-page">
                        <div class="form">
                            <form action="ScreeningInfo" method="post" class="screeninginfo-form">

                                <%
                                    int movieID;
                                    MovieDetails md = new MovieDetails();
                                    HttpSession s = request.getSession();
                                    movieID = Integer.parseInt(s.getAttribute("screenmovieid").toString());
                                    ResultSet rs = md.getMovieScreeningInfo(movieID);
                                    StringBuffer displayBuf2 = new StringBuffer();
                                    displayBuf2.append("<select name='screening' id='screening'>");
                                    String movieName = "", screeningTime = "", screeningDate = "", screenName = "";
                                    int screeningID;
                                    while (rs.next()) {
                                        screeningID = rs.getInt("screeningID");
                                        movieName = rs.getString("movieName");
                                        screenName = rs.getString("screenName");
                                        screeningDate = rs.getString("screeningDate");
                                        screeningTime = rs.getString("screeningTime");
                                        //movieIcon = rs.getString("icon");
                                        displayBuf2.append(
                                                "<option value='" + screeningID
                                                + "'>" + movieName + "@" + screenName
                                                + " " + screeningDate + " " + screeningTime
                                                + "</option>"
                                        );
                                    }
                                    displayBuf2.append("</select>");
                                    displayBuf2.append("<button>Select seats</button>");
                                    out.println(displayBuf2);
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
    </body>
</html>
