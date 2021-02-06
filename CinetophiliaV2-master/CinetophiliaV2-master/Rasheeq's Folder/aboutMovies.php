<!DOCTYPE html>
<html>
<head>
	<title>About Movies</title>
	<link rel="stylesheet"  href="CSS/stylesAboutMoviesV2.css">
	<link rel="stylesheet" href="CSS/navbar.css">
</head>

<body>
	
  <?php include 'navbar.php';?>
  <?php include 'config.php';?>

  <?php
  
            $query = "SELECT * from movies where id = ".$_GET['movie_id'];
            $players_query_result = mysqli_query($link, $query) or die(mysql_error());
            $row = array();
            if(mysqli_num_rows($players_query_result) > 0)
            {
                $row = mysqli_fetch_array($players_query_result);
            }
            
  ?>

	<div class="wrap">
	<div class="Trailers">
		<div style="position:relative;height:0;padding-bottom:56.25%"><iframe src="<?php echo $row['trailer_link'];?>" width="640" height="360" frameborder="0" style="position:absolute;width:100%;height:100%;left:0" allowfullscreen></iframe></div>
	</div>
	<div class="showtimes">
		<h2 style="background-color: #B8312F; border-radius:0 15px 15px 0;">Showtimes</h2>
		<p>Enter your location to see where <?php echo $row['Title'];?> is playing near you </p>
	  	<div class="search">
      		<input type="text" class="searchTerm" placeholder="Enter Your Location and ZIP"/>
     		<input type="submit" class="searchButton" value="Submit">
     	</div>
	</div>
	<div class="photos">
		<h2 style="background-color: #B8312F; border-radius:0 15px 15px 0;"><?php echo $row['Title'];?> Photo's</h2>
		<div><img src="img/movie/img12.jpg", style="width: 100%"></div>
		<div><img src="img/movie/img13.jpg",, style="width: 100%"></div>
		<div><img src="img/movie/img14.jpg",, style="width: 100%"></div>
	</div>
	<div class="info">
		<h2 style="background-color: #B8312F; border-radius:0 15px 15px 0;">Movie Info</h2>
		<p><?php echo $row['details'];?><br><br>
        <b>More:</b><br>
        Rating:	<?php echo $row['Rating'];?><br>
        Genre:	Action & Adventure, Drama, Science Fiction & Fantasy<br>
        Directed By:	Jon Watts<br>
        Written By:	Jonathan M. Goldstein, John Francis Daley, Christopher Ford, Chris McKenna, Erik Sommers<br>
        In Theaters:	<?php echo $row['Release_date'];?><br>
        Box Office:	$117,027,503<br>
        Studio:	Sony Pictures </p>
	</div>
	<div class="cast">
	<h2 style="background-color: #B8312F; border-radius:0 15px 15px 0;">Cast</h2>
    <img src="img/movie/img15.jpg", style="width: 40%"><a class="cast" href="#">Tom Holland</a>
	<img src="img/movie/img16.jpg", style="width: 40%"><a class="cast" href="#">Donald Glover</a>	
	</div>
	<div class="top review">
	<h2 style="background-color: #B8312F; border-radius:0 15px 15px 0;">Top Review</h2>
	<p>
	<b>Monchuri</b>
	<p>An utter gas, a fast and very funny superflick that inserts Spidey into the larger Marvel Cinematic Universe without ever losing sight of what makes him unique and beloved.</p></p>
		
	</div>
	</div>
	
  <?php include 'close.php'; ?>

</body>
</html>