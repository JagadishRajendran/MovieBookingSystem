<%--
    Document   : PaymentInfo
    Created on : Nov 18, 2017, 3:12:14 PM
    Author     : nithi
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Services.MovieDetails"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order review & Payment</title>
    </head>
    <body>
        <div id="wrapper">
            <div id="content">
                <div id="rotator">
                    <div class="showseats-page">
                        <div class="form">
                            <form action="PaymentInfo" method="post" class="payment-form">
                                <%
                                    StringBuffer displayBuf2 = new StringBuffer();
                                    MovieDetails md = new MovieDetails();
                                    HttpSession s = request.getSession();
                                    String selectedSeats = s.getAttribute("selectedseats").toString();
                                    String food = s.getAttribute("selectedfood").toString();
                                    int screeningID = Integer.parseInt(s.getAttribute("screeningID").toString());
                                    int movieID = Integer.parseInt(s.getAttribute("movieID").toString());
                                    int seatCount = Integer.parseInt(s.getAttribute("seatCount").toString());
                                    double price = 0;
                                    price += seatCount * 10;
                                    String ShowSeats = selectedSeats.replace("'", "");
                                    ResultSet rs = md.getMovieInfo(movieID);
                                    rs.next();
                                    String movieName = rs.getString("name");
                                    rs = md.getScreeningInfo(screeningID);
                                    rs.next();
                                    String screenName = rs.getString("screenName");
                                    String screenDate = rs.getString("screeningDate");
                                    String screenTime = rs.getString("screeningTime");
                                    displayBuf2.append("<table>");
                                    displayBuf2.append("<tr><td>Movie<td><td>:</td><td>" + movieName + "</td></tr>");
                                    displayBuf2.append("<tr><td>Screen<td><td>:</td><td>" + screenName + "</td></tr>");
                                    displayBuf2.append("<tr><td>Date<td><td>:</td><td>" + screenDate + "</td></tr>");
                                    displayBuf2.append("<tr><td>Time<td><td>:</td><td>" + screenTime + "</td></tr>");
                                    displayBuf2.append("<tr><td>Seats<td><td>:</td><td>" + ShowSeats + "</td></tr>");
                                    displayBuf2.append("<tr><td>Seat Count<td><td>:</td><td>" + seatCount + "</td></tr>");
                                    displayBuf2.append("<tr><td>Food<td><td>:</td><td>");
                                    if (!food.matches("(.*)\\d+>\\d+(.*)")) {
                                        displayBuf2.append("None</td></tr>");
                                    } else {
                                        String selectedFood[] = food.split(",");
                                        String foodIdCount[];
                                        int foodIDnCount[][];
                                        int foodIDs[];
                                        for (String temp : selectedFood) {
                                            if (temp.matches("\\d+>\\d+")) {
                                                foodIdCount = temp.split(">");
                                                if (Integer.parseInt(foodIdCount[1]) != 0) {
                                                    int foodID = Integer.parseInt(foodIdCount[0]);
                                                    int foodCount = Integer.parseInt(foodIdCount[1]);
                                                    ResultSet fd = md.getFoodDetails(foodID);
                                                    fd.next();
                                                    String fName = fd.getString("food_name");
                                                    String fSize = fd.getString("size");
                                                    double fPrice = fd.getFloat("price");
                                                    price += fPrice * foodCount;
                                                    displayBuf2.append(fName + "&nbsp" + fSize + "&nbsp" + foodCount + " Nos.<br>");
                                                }
                                            }
                                        }
                                        displayBuf2.append("</td></tr><tr><td>Total<td><td>:</td><td>$" + price + "</td></tr>");
                                        displayBuf2.append("</td></tr></table><br>");
                                    }
                                    displayBuf2.append("<h3>Payment Info:</h3><br>");
                                    displayBuf2.append("<table><tr><td>Card Number</td><td>:</td><td><input type='number' maxlength='16'></td></tr>");
                                    displayBuf2.append("<tr><td>Card holder's name</td><td>:</td><td><input type='text'></td></tr>");
                                    displayBuf2.append("<tr><td>Security code</td><td>:</td><td><input type='number' maxlength='3'></td></tr>");
                                    displayBuf2.append("<tr><td>Zip</td><td>:</td><td><input type='number' maxlength='5'></td></tr>");
                                    displayBuf2.append("</table>");
                                    displayBuf2.append("<button>Pay</button>");

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
