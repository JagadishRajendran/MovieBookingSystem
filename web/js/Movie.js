/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function selectedMovie(movieid) {
    alert("Inside-->"+movieid);
        
    document.getElementById("hidmovieid").value = movieid;
    var test=document.getElementById("hidmovieid").value;
    alert("Inside2222-->"+test);
    document.getElementById("displayMovieForm").submit();    

}