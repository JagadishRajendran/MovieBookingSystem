/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Services.LoginCredentials;
import Bean.LoginInfo;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author JAGADISH
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //response.setContentType("text/html;charset=UTF-8");
        
        String operation="";
        
        HttpSession session= request.getSession();
        
        
        operation=request.getParameter("hidoperation");
        System.out.println("operation--->"+operation);
        if(operation.equals("login")){
            LoginInfo loginInfo=new LoginInfo();
            loginInfo.setLogin_id(request.getParameter("loginid"));
            loginInfo.setPassword(request.getParameter("password"));
            LoginCredentials lc= new LoginCredentials();
            Boolean validUser= lc.checkCredentials(loginInfo);
            
            session.setAttribute("validuser", validUser);
            System.out.println("validuser-->"+validUser);
            if(validUser){
               response.sendRedirect("welcome.jsp");
            }
            else{
               response.sendRedirect("login.jsp");
            }
            
            
        }
        else{
            LoginInfo loginInfo=new LoginInfo();
            LoginCredentials lc= new LoginCredentials();
            
            loginInfo.setLogin_id(request.getParameter("loginid"));
            loginInfo.setPassword(request.getParameter("password"));
            loginInfo.setFirst_name(request.getParameter("firstname"));
            loginInfo.setLast_name(request.getParameter("lastname"));
            Boolean registerStarus=lc.registerUser(loginInfo);
            session.setAttribute("registerStarus", registerStarus);
                
            response.sendRedirect("login.jsp");
        }
        
        
        
        
        //session.setAttribute("username", loginInfo.getUser_name());
        
    }

    

}
