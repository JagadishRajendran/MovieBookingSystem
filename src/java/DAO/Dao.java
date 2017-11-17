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
            /*java.util.Date screeningDate = new java.util.Date();
            SimpleDateFormat simpDate2=new SimpleDateFormat("dd-MM-yyyy HH:mm");
            String screenDate=simpDate2.format(movieInfo.getScreeningTime());
            
            
            SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy HH:mm");
            java.util.Date date = sdf1.parse(screenDate);
             
            java.sql.Timestamp sqlDate = new java.sql.Timestamp(date.getTime());*/
            
            
            java.sql.Date sqlpub_date= new java.sql.Date(movieInfo.getScreeningDate().getTime());
            System.out.println("getScreeningDate--->"+sqlpub_date);
            
            //Insert query to insert values into
            mysql_QueryA = "INSERT INTO screening(screening_date,screening_time ,movie_id,screen_id) VALUES (?,?,?,?)";
            PreparedStatement statement = myConn.prepareStatement(mysql_QueryA);
            statement.setDate(1, sqlpub_date);
            statement.setString(2,  movieInfo.getScreeningTime());
            statement.setString(3,movieInfo.getMovieId());
            statement.setString(4,movieInfo.getScreenId());
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
        
        try {
            myStmt = myConn.createStatement();String mysql_QueryA;
            // Update query to update values into .
            mysql_QueryA = "update movie set name='"+movieInfo.getMovie_name()+"', director='"+movieInfo.getDirector()+
            "', cast='"+movieInfo.getCast()+"', description='"+movieInfo.getDescription()+"', duration='"+movieInfo.getDuration()+"'";
            if(movieInfo.getMovie_icon()!=null && movieInfo.getMovie_icon()!=""){
                mysql_QueryA=mysql_QueryA+ ", icon='"+movieInfo.getMovie_icon()+"'";
            }
            mysql_QueryA=mysql_QueryA+ " where id='"+movieInfo.getMovieId()+"'";
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
        }
        
        
    }
    
    public Boolean deleteMovie(MovieInfo movieInfo){
        
        getConnection();
        int rows_insertedB=0;
        try {
            myConn.setAutoCommit(false);
            myStmt = myConn.createStatement();
            String mysql_QueryA,mysql_QueryB;
            // Update query to update values into .
            mysql_QueryA = "delete from movie where id="+movieInfo.getMovieId();
            if(movieInfo.getScreeningId()!=null && movieInfo.getScreeningId().equals("")){
                mysql_QueryB = "delete from screening where id="+movieInfo.getScreeningId();
                PreparedStatement statementB = myConn.prepareStatement(mysql_QueryB);
                rows_insertedB = statementB.executeUpdate();
            }    
            // To execute the query.
            PreparedStatement statementA = myConn.prepareStatement(mysql_QueryA);
            
            
            int rows_insertedA = statementA.executeUpdate();
            
            myConn.commit();
            System.out.println("rows--->"+rows_insertedA+"B-->"+rows_insertedB);
            if (rows_insertedA>0 && rows_insertedB>0)
            {
                System.out.println("inserted number of rows: "+rows_insertedA+"B-->"+rows_insertedB);
                return true;
            }
            else{
                myConn.rollback();
                return false;
            }
            
        }
        catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
        
    }
    
    public ResultSet getMovieScreeningInfoDao(int movieID) {

        getConnection();

        try {
            myStmt = myConn.createStatement();
            String mysql_movieScrQuery;
            mysql_movieScrQuery = "select m.name movieName, s.name screenName, sg.screen_id screenID, sg.screening_date screeningDate, sg.screening_time screeningTime, sg.id screeningID "
                    + "from movie m, screening sg, screen s "
                    + "where sg.screen_id = s.id and "
                    + "sg.movie_id = m.id and "
                    + "sg.movie_id = " + movieID;
            myRs = myStmt.executeQuery(mysql_movieScrQuery);
        } catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return myRs;
    }
    
    
    
    public ResultSet getMovieInfoDao(int movieID) {

        getConnection();

        try {
            myStmt = myConn.createStatement();
            String mysql_movieDetQuery;
            mysql_movieDetQuery = "select name,director,cast,description,duration,icon from movie where id = " + movieID;
            myRs = myStmt.executeQuery(mysql_movieDetQuery);
        } catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return myRs;
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
    
    public ResultSet fetchMovieScreeingDtls() {
    	getConnection();
    	try {
            myStmt = myConn.createStatement();
            myRs = myStmt.executeQuery("SELECT movie.name movie_name,director,screening_view.name screen_name,no_of_seats,screening_date,screening_time,movie_id,screening_view.screening_id,screen_id\n" +
                "FROM movie\n" +
                "LEFT JOIN (select name,no_of_seats,screening_date,screening_time,movie_id,screen_id,screening.id screening_id from screen,screening where screen.id = screen_id) as screening_view ON movie.id = movie_id");
            return myRs;
    	} catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
    	}
            
    }
    
    public ResultSet fetchMovieByMovieId(MovieInfo movieInfo) {
    	getConnection();
    	try {
            myStmt = myConn.createStatement();
            myRs = myStmt.executeQuery("SELECT * from movie where id="+movieInfo.getMovieId());
            return myRs;
    	} catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
    	}
            
    }

}     

