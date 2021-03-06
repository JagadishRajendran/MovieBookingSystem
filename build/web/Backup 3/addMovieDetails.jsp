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
        <title>Insert Movies</title>
        <link rel='stylesheet prefetch' href='https://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css'>
        <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Poiret+One'>
        <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'>
        <link rel='stylesheet prefetch' href='https://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap-theme.min.css'>
        
        <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
        <script src='https://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js'></script>
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
        <script>
        $(function()
        {

            $("#director").rules('add', 
            {
                required:true,


                messages: 
                {
                        required: "<br><font color=red>Select Expiry Date</font>"


                }


            });
            $("#btnConf").click(function()
            {
                if($("#form1").valid() )
                {

                        if(Bankfun && panVal && Date1 && Date2 && pfno)
                        {			
                                if(confirm(" Once confirmed you cannot do any modification. Do you wish to confirm the changes? "))
                                {
                                        document.getElementById("form1").submit();
                                }
                                else
                                {
                                        return false;
                                }


                        }	
                }
            });
        });
            </script>
    <style type="text/css" media="screen">
        body {
          background-color:#141311;
          color:#d75813;
          padding: 100px; 
       }
        </style>
    </head>
    <body>
    <div class="container">
    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand" href="#">Insert Movies</a>
        </div>
      </div>
    </div>
    </div>
        
        <br>
        <div class="container">
	  <ul class="nav nav-tabs">
	    <li style="font-size:150%"><a href="displayMovieScreening.jsp">Home</a></li>
	    <li style="font-size:150%" class="active"><a href="#">Insert Movies</a></li>
	    <li style="font-size:150%"><a href="addScreeningDetails.jsp">Screening Time</a></li>
	    <li style="font-size:150%"><a href="#">Food</a></li>
  	  </ul>
        <br>
  
        </div>
            <div class="container">
                <form action="Movie" id="addMovieForm" method="post" class="form-horizontal" enctype="multipart/form-data">
                                <div class="form-group">                            
                                    <div class="col-sm-4">
                                        <label for="name">Name</label>          
                                        <input class="form-control" type='text' placeholder='Movie Name' name='title' id='title'/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        <label for="director name">Director Name</label>
                                        <input class="form-control" type='text' placeholder='Director' name='director' id='director'/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        <label for="cast">Cast Name</label>
                                        <input class="form-control" type='text' placeholder='Cast' name='cast' id='cast'/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        <label for="description">Description</label>
                                        <input class="form-control" type='textarea' placeholder='Description' name='description' id='description'/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        <label for="run-time">Running Time</label>
                                        <input class="form-control" type='text' placeholder='Duration' name='duration' id='duration'/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        <label for="select-image">Select Image</label><br>
                                        <input  class="browse btn btn-primary input-md" type="file" name="file">
                                    </div>
                                </div>
                                <br>
                                <input type='hidden'  name='hidoperation' id='hidoperation' value='insert'/>
                                
                                <input  class="btn btn-info" type="submit" value="Submit" name="newmovie" />
                                
                                <%
                                    /*StringBuffer displayBuf2= new StringBuffer();
                                    displayBuf2.append("<input type='text' placeholder='Email id' name='loginid' id='loginid'/>");
                                    displayBuf2.append("<input type='password' placeholder='Password' name='password' id='password'/>");
                                    displayBuf2.append("<input type='hidden'  name='hidoperation' id='hidoperation' value='login'/>");
                                    displayBuf2.append("<button>login</button>");
                                    //displayBuf2.append("<p class=/"message/">Not registered? <a href=/"#/">Create an account</a></p>");
                                    
                                    out.println(displayBuf2);*/
                                %>
                            </form>                            

                        </div>
    </body>
</html>
