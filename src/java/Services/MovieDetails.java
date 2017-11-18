/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import Bean.MovieInfo;
import DAO.Dao;
import java.sql.ResultSet;

/**
 *
 * @author JAGADISH
 */
public class MovieDetails {
    public void getMovieNamesIcon(MovieInfo mi) {
    	Dao dao = new Dao();
    	mi.setAllMovieNamesIcon(dao.getAllMovieNamesIcon());
    }
    public void getScreeningDtls(MovieInfo mi) {
    	Dao dao = new Dao();
    	mi.setAllScreenNames(dao.fetchScreenInfo());
    }
    public ResultSet getMovieInfo(int movieID) {
        Dao dao = new Dao();
        ResultSet rs = dao.getMovieInfoDao(movieID);
        return rs;
    }

    public ResultSet getMovieScreeningInfo(int movieID) {
        Dao dao = new Dao();
        ResultSet rs = dao.getMovieScreeningInfoDao(movieID);
        return rs;
    }
    
    public ResultSet getMovieReview(MovieInfo mi) {
        Dao dao = new Dao();
        ResultSet rs = dao.fetchMovieReview(mi);
        return rs;
    }

   /* public ResultSet getBlockedSeats(int screeningID) {
        Dao dao = new Dao();
        ResultSet rs = dao.GetBlockedSeatsDao(screeningID);
        return rs;
    }*/

}
