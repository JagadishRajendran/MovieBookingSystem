package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Register_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/style.css\" type=\"text/css\" />\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div id=\"wrapper\">\n");
      out.write("            <div id=\"header\">\n");
      out.write("                <ul id=\"mainnav\">\n");
      out.write("                    <li class=\"current\"><a href=\"#\">Home</a></li>\n");
      out.write("                    <li><a href=\"#\">Book Tickets</a></li>\n");
      out.write("                    <li><a href=\"#\">Movies Playing</a></li>\n");
      out.write("                    <li><a href=\"#\">My Booking</a></li>\n");
      out.write("                    <li><a href=\"#\">My Account</a></li>\n");
      out.write("                    <li><a href=\"#\">Contact Us</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("            <div id=\"content\">\n");
      out.write("                <div id=\"rotator\">\n");
      out.write("                        <div class=\"login-page\">\n");
      out.write("                        <div class=\"form\">\n");
      out.write("                            \n");
      out.write("                            <form class=\"register-form\" action=\"Login\" method=\"get\">\n");
      out.write("                                ");

                                    StringBuffer displayBuf1= new StringBuffer();
                                    HttpSession ses= request.getSession();
                                    String status="true";
                                    if(ses.getAttribute("regstatus")!=null){
                                        status=ses.getAttribute("regstatus").toString();
                                    } 
                                    displayBuf1.append("<input type='text' placeholder='First Name' id='firstname' name='firstname'/>");
                                    displayBuf1.append("<input type='text' placeholder='Last Name' id='lastname' name='lastname'/>");
                                    displayBuf1.append("<input type='text' placeholder='Email id' id='loginid'  name='loginid'/>");
                                    displayBuf1.append("<input type='hidden'  name='hidoperation' id='hidoperation' value='register'/>");
                                    displayBuf1.append("<input type='password' placeholder='password' name='password' id='password'/>");
                                    if( status!=null && !status.equals("")){
                                        System.out.println("status--->"+status);
                                        if(status.equals("false")){
                                            displayBuf1.append("<a style='color:red';/>User already registered</a>");
                                            ses.setAttribute("regstatus", "true");
                                        }
                                    }
                                    //displayBuf1.append("<input type='text' placeholder='email address' id='emailid'/>");
                                    //
                                    displayBuf1.append("<p class='message'>Already registered? <a href='/MovieBookingSystem/Login.jsp'>Sign In</a></p>");
                                    displayBuf1.append("<button>sign up</button>");
                                    out.println(displayBuf1);
                                
      out.write("\n");
      out.write("                                \n");
      out.write("                            </form>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("  \n");
      out.write("        <div id=\"featured\">\n");
      out.write("            <h1>Online Movie Ticket Reservation system<a href=\"#\"></a></h1>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div id=\"footer\">\n");
      out.write("        <h4><p>&copy; Copyright 2017 SANJ  All Rights Reserved <br /></p></h4>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js\"></script>\n");
      out.write("    <script src=\"js/animate.js\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
