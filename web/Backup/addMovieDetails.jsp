<%-- 
    Document   : index
    Created on : Nov 4, 2017, 5:39:28 PM
    Author     : JAGADISH
--%>

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
                                <input type='text' placeholder='Movie Name' name='title' id='title'/>
                                <input type='text' placeholder='Director' name='director' id='director'/>
                                <input type='text' placeholder='Cast' name='cast' id='cast'/>
                                <input type='textarea' placeholder='Description' name='description' id='description'/>
                                <input type='text' placeholder='Duration' name='duration' id='duration'/>
                                <input type="file" name="file">
                                <input type='hidden'  name='hidoperation' id='hidoperation' value='insert'/>
                                <input  type="submit" value="Submit" name="newmovie" />
                                
                                <%
                                    StringBuffer displayBuf2= new StringBuffer();
                                    /*displayBuf2.append("<input type='text' placeholder='Email id' name='loginid' id='loginid'/>");
                                    displayBuf2.append("<input type='password' placeholder='Password' name='password' id='password'/>");
                                    displayBuf2.append("<input type='hidden'  name='hidoperation' id='hidoperation' value='login'/>");
                                    displayBuf2.append("<button>login</button>");
                                    //displayBuf2.append("<p class=/"message/">Not registered? <a href=/"#/">Create an account</a></p>");
                                    
                                    out.println(displayBuf2);*/
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="js/animate.js"></script>
    </body>
</html>
