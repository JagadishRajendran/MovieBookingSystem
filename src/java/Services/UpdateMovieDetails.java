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
public class UpdateMovieDetails {
    
        
    public Boolean insertMovie(MovieInfo movieInfo){
        Dao dao=new Dao();
        Boolean insertStatus=dao.InsertMovie(movieInfo);
        return insertStatus;
    }

    public Boolean updateMovie(MovieInfo movieInfo){
        Dao dao=new Dao();
        Boolean insertStatus=dao.updateMovie(movieInfo);
        return insertStatus;
    } 

    public Boolean deleteMovie(MovieInfo movieInfo){
        Dao dao=new Dao();
        Boolean deleteStatus=dao.deleteMovie(movieInfo);
        return deleteStatus;
    }     
    
    
}
