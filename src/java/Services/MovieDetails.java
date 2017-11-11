/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import Bean.MovieInfo;
import DAO.Dao;

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

}
