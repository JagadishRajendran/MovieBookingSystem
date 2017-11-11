/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

import java.sql.ResultSet;
import java.util.Date;

/**
 *
 * @author JAGADISH
 */
public class MovieInfo {
    private String movie_name;
    private String director;
    private String cast;
    private String description;
    private String movie_icon;
    private int duration;
    private ResultSet allMovieNamesIcon;
    private ResultSet allScreenNames;
    private Date screeningTime;
    private String screenName;
    private String screenId;
    private String movieId;

    public String getScreenName() {
        return screenName;
    }

    public void setScreenName(String screenName) {
        this.screenName = screenName;
    }

    public String getScreenId() {
        return screenId;
    }

    public void setScreenId(String screenId) {
        this.screenId = screenId;
    }

    public String getMovieId() {
        return movieId;
    }

    public void setMovieId(String movieId) {
        this.movieId = movieId;
    }
    
    public Date getScreeningTime() {
        return screeningTime;
    }

    public void setScreeningTime(Date screeningTime) {
        this.screeningTime = screeningTime;
    }
    
    public ResultSet getAllScreenNames() {
        return allScreenNames;
    }

    public void setAllScreenNames(ResultSet allScreenNames) {
        this.allScreenNames = allScreenNames;
    }
    
    public ResultSet getAllMovieNamesIcon() {
        return allMovieNamesIcon;
    }

    public void setAllMovieNamesIcon(ResultSet allMovieNamesIcon) {
        this.allMovieNamesIcon = allMovieNamesIcon;
    }
    
    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    
    public String getMovie_name() {
        return movie_name;
    }

    public void setMovie_name(String movie_name) {
        this.movie_name = movie_name;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getCast() {
        return cast;
    }

    public void setCast(String cast) {
        this.cast = cast;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getMovie_icon() {
        return movie_icon;
    }

    public void setMovie_icon(String movie_icon) {
        this.movie_icon = movie_icon;
    }
    
}
