package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import Services.FetchMovieScreening;

public final class displayMovieScreening_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>admin</title>\n");
      out.write("        <link rel='stylesheet prefetch' href='https://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css'>\n");
      out.write("        <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Poiret+One'>\n");
      out.write("        <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'>\n");
      out.write("        <link rel='stylesheet prefetch' href='https://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap-theme.min.css'>\n");
      out.write("        <script src='https://code.jquery.com/jquery-1.10.1.min.js'></script>\n");
      out.write("        <script src='https://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js'></script>\n");
      out.write("    <style type=\"text/css\" media=\"screen\">\n");
      out.write("        body {\n");
      out.write("          padding-top: 80px;\n");
      out.write("          padding-left: 180px;\n");
      out.write("          background-color:#141311;\n");
      out.write("          color:#d75813;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container\">\n");
      out.write("    <div class=\"navbar navbar-inverse navbar-fixed-top\" role=\"navigation\">\n");
      out.write("      <div class=\"container\">\n");
      out.write("        <div class=\"navbar-header\">\n");
      out.write("          <a class=\"navbar-brand\" href=\"#\">ADMIN</a>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("        <h1 id=\"heading-page\">Admin Page</h1>\n");
      out.write("        <br>\n");
      out.write("\t<div class=\"container\">\n");
      out.write("\t  <ul class=\"nav nav-tabs\">\n");
      out.write("\t    <li style=\"font-size:150%\"class=\"active\"><a href=\"#\">Home</a></li>\n");
      out.write("\t    <li><a style=\"font-size:150%\" href=\"#\">Insert Movies</a></li>\n");
      out.write("\t    <li><a style=\"font-size:150%\" href=\"#\">Screening Time</a></li>\n");
      out.write("\t    <li><a style=\"font-size:150%\" href=\"#\">Food</a></li>\n");
      out.write("  \t  </ul>\n");
      out.write("        <br>\n");
      out.write("  \n");
      out.write("        </div>\n");
      out.write("            <div class=\"container\">\n");
      out.write("                            <form action=\"Movie\" method=\"post\" class=\"login-form\" enctype=\"multipart/form-data\">\n");
      out.write("                            <font size=\"5\">\n");
      out.write("                            <table id=\"table-control\" class=\"table table-bordered\">                                \n");
      out.write("                                    <tr>\n");
      out.write("                                      <th>Movie Name</th>\n");
      out.write("                                      <th>Director</th> \n");
      out.write("                                      <th>Screen Name</th>\n");
      out.write("                                      <th>Screen Date</th>\n");
      out.write("                                      <th>Screen Time</th>\n");
      out.write("                                      <th>Modify</th>\n");
      out.write("                                      <th>Delete</th>\n");
      out.write("                                    </tr>\n");
      out.write("                                    ");

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
                                    
      out.write("    \n");
      out.write("                                </table>\n");
      out.write("                                </font>\n");
      out.write("                            </form>             \n");
      out.write("<!--        </div>-->\n");
      out.write("  \n");
      out.write("\n");
      out.write("    \n");
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
