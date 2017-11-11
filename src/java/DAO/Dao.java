/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.LoginInfo;
import Bean.MovieInfo;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JAGADISH
 */
public class Dao {
    Connection myConn = null;
    Statement myStmt = null;
    ResultSet myRs = null;
    public Connection getConnection(){
        try {
            // Get a connection to database
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            System.out.println("Attempting to connect to database. Trying hard!");
            myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "");
        }catch (Exception exc) {
            exc.printStackTrace();
        }
        return myConn;
    } 
    public Boolean InsertUser(LoginInfo loginInfo){
        
        getConnection();
        
        try {
            myStmt = myConn.createStatement();String mysql_QueryA;
            // Insert query to insert values into Instructor
            mysql_QueryA = "INSERT INTO user_dtls(F_name,L_name,Email,Password) VALUES (?,?,?,?)";
            PreparedStatement statement = myConn.prepareStatement(mysql_QueryA);
            statement.setString(1,loginInfo.getFirst_name());
            statement.setString(2,loginInfo.getLast_name());
            statement.setString(3,loginInfo.getLogin_id());
            statement.setString(4,loginInfo.getPassword());
            System.out.println("statement---"+statement);
            int rows_inserted = statement.executeUpdate();
            System.out.println("rows---"+rows_inserted);
            if (rows_inserted>0)
            {
                System.out.println("inserted number of rows: "+rows_inserted);
                return true;
            }
            else{
                return false;
            }
            
        }
        catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
        
    }
    
    public ResultSet validateUser(LoginInfo loginInfo){
        System.out.println("usr name--->"+loginInfo.getLogin_id());
        getConnection();
        System.out.println("usr name2--->"+loginInfo.getLogin_id());
        try {
            myStmt = myConn.createStatement();
            myRs = myStmt.executeQuery("SELECT * FROM user_dtls where Email='"+loginInfo.getLogin_id()+"'");
            
                
            
        }
        catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return myRs;
    }
    
    
    public Boolean InsertSreening(MovieInfo movieInfo){
        
        getConnection();
        
        try {
            myStmt = myConn.createStatement();String mysql_QueryA;
            java.util.Date screeningDate = new java.util.Date();
            SimpleDateFormat simpDate2=new SimpleDateFormat("dd-MM-yyyy HH:mm");
            String screenDate=simpDate2.format(movieInfo.getScreeningTime());
            
            
            String startDate="01-02-2013";
            SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy HH:mm");
            java.util.Date date = sdf1.parse(screenDate);
             
            java.sql.Timestamp sqlDate = new java.sql.Timestamp(date.getTime());
            
            
            
            
            //Insert query to insert values into
            mysql_QueryA = "INSERT INTO screening(time,movie_id,screen_id) VALUES (?,?,?)";
            PreparedStatement statement = myConn.prepareStatement(mysql_QueryA);
            statement.setTimestamp(1, sqlDate);
            statement.setString(2,movieInfo.getMovieId());
            statement.setString(3,movieInfo.getScreenId());
            int rows_inserted = statement.executeUpdate();
            if (rows_inserted>0)
            {
                System.out.println("inserted number of rows: "+rows_inserted);
                return true;
            }
            else{
                return false;
            }
            
        }
        catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }catch (ParseException ex) {
                Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
                return false;
        }
        
        
    }
    
    public Boolean InsertMovie(MovieInfo movieInfo){
        
        getConnection();
        
        try {
            myStmt = myConn.createStatement();String mysql_QueryA;
            // Insert query to insert values into Instructor
            mysql_QueryA = "INSERT INTO movie(name,director,cast,description,duration,icon) VALUES (?,?,?,?,?,?)";
            PreparedStatement statement = myConn.prepareStatement(mysql_QueryA);
            statement.setString(1,movieInfo.getMovie_name());
            statement.setString(2,movieInfo.getDirector());
            statement.setString(3,movieInfo.getCast());
            statement.setString(4,movieInfo.getDescription());
            statement.setInt(5,movieInfo.getDuration());
            statement.setString(6,movieInfo.getMovie_icon());
            int rows_inserted = statement.executeUpdate();
            if (rows_inserted>0)
            {
                System.out.println("inserted number of rows: "+rows_inserted);
                return true;
            }
            else{
                return false;
            }
            
        }
        catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
        
    }
    public Boolean updateMovie(MovieInfo movieInfo){
        
        getConnection();
        
        /*try {
            myStmt = myConn.createStatement();String mysql_QueryA;
            // Update query to update values into .
            mysql_QueryA = "UPDATE movie SET name='"+coursestr+"', book_title_1='"+titlestr+
            "', book_title_2='"+titlestr_2+"', book_publisher_1='"+publisherstr+"', book_publisher_2='"+publisherstr_2+"', book_edition_1="+edition+
            ", book_edition_2="+edition_2+", date_1="+pub_date+", date_2="+pub_date_2+" where Course_Name='"+hidcoursestr+"'";
            // To execute the query.
            PreparedStatement statement = myConn.prepareStatement(mysql_QueryA);
            
            
            System.out.println("statement--->"+statement);
            int rows_inserted = statement.executeUpdate();
            System.out.println("rows--->"+rows_inserted);
            if (rows_inserted>0)
            {
                System.out.println("inserted number of rows: "+rows_inserted);
                return true;
            }
            else{
                return false;
            }
            
        }
        catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }*/
        return false;
        
    }
    
    
    public ResultSet getAllMovieNamesIcon() {
    	getConnection();
    	try {
            myStmt = myConn.createStatement();
            myRs = myStmt.executeQuery("select id,name,icon from movie");
            return myRs;
    	} catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
    	}
            
    }
    
    public ResultSet fetchScreenInfo() {
    	getConnection();
    	try {
            myStmt = myConn.createStatement();
            myRs = myStmt.executeQuery("select * from screen");
            return myRs;
    	} catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
    	}
            
    }

}     

