<%--
    Document   : FoodSelect
    Created on : Nov 18, 2017, 11:43:25 AM
    Author     : nithi
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Services.MovieDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Select Food</title>
    </head>
    <body>
        <div id="wrapper">
            <div id="content">
                <div id="rotator">
                    <div class="showseats-page">
                        <div class="form">
                            <form action="FoodSelect" method="post" class="foodselect-form">
                                <%
                                    MovieDetails md = new MovieDetails();
                                    HttpSession s = request.getSession();
                                    String selectedSeats = s.getAttribute("selectedseats").toString();
                                    int movieID = Integer.parseInt(s.getAttribute("movieID").toString());
                                    ResultSet rs = md.getFoods();
                                    StringBuffer displayBuf2 = new StringBuffer();
                                    displayBuf2.append("<table>");
                                    while (rs.next()) {
                                        String foodName = rs.getString("food_name");
                                        ResultSet rs2 = md.getFoodDetails(foodName);
                                        //displayBuf2.append("<input type=checkbox name=check'" + foodName + "'>" + foodName);

                                        displayBuf2.append("<tr><td>" + foodName + "</td><td><select name='" + foodName + "' id='" + foodName + "'>");
                                        int foodID = 0;
                                        displayBuf2.append("<option value='" + foodID + "' selected></option>");
                                        while (rs2.next()) {
                                            foodID = rs2.getInt("food_id");
                                            String foodSize = rs2.getString("size");
                                            float foodPrice = rs2.getFloat("price");
                                            displayBuf2.append("<option value='" + foodID + "'>" + foodSize + "@ $" + foodPrice + "</option>");
                                        }
                                        displayBuf2.append("</select></td>");
                                        displayBuf2.append("<td>Count : <input type=number name='" + foodName + "Count" + "'id='" + foodName + "Count" + "' value='0' step='1' min='0' max='10' placeholder='count'></td></tr>");
                                    }
                                    displayBuf2.append("</table>");
                                    displayBuf2.append("<button>Review Order & Pay</button>");
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
