<!DOCTYPE html>
<html>
<head>
	<title>Cinetophilia</title>

  <link rel="stylesheet" href="CSS/stylesHome.css">
  <link rel="stylesheet" href="CSS/cinetophiliaTheme.css">
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>

  <?php include 'navbar.php';?>
  <?php include 'config.php';?>

  <!--
  <div id="fb-root"></div>
  <script>(function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.10&appId=650634355146855";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));</script>

  
  <div class="fb-login-button" data-max-rows="2" data-size="large" data-button-type="continue_with" data-show-faces="true" data-auto-logout-link="true" data-use-continue-as="true"></div>
  -->
  
  <div class="slideshow-container">
    	<div class="text">Now Showing</div>
      <?php
        for ($i=1; $i <= 5; $i++) {
      ?>
  		  <div class="mySlides fade">
          <img src="img/movie/img<?php echo $i;?>.jpg" style="width:100%">
        </div>
      <?php
        }
      ?>
  	 <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
 		 <a class="next" onclick="plusSlides(1)">&#10095;</a>
	</div>

  
	<div style="text-align:center">
    <?php
        for ($i=1; $i <= 5; $i++) {
    ?>
  		<span class="dot" onclick="currentSlide(<?php echo $i;?>)"></span> 
  	<?php
      }
    ?>
	</div>



	<div>
		<h2 style="background-color: #B8312F; border-radius: 0px 15px 15px 0px;">Weekend Box Office</h2>
    <?php
              $newquery = "select movie_id, m.image_id from daily_box_office as dbo inner join movies as m on m.id = dbo.movie_id where date between DATE_SUB(NOW(), INTERVAL 7 DAY) and NOW() group by movie_id order by sum(amount) desc";
              $new_query_result = mysqli_query($link, $newquery) or die(mysql_error());
              $j = 0;
              if(mysqli_num_rows($new_query_result) > 0)
              {
                  while ($row2 = mysqli_fetch_array($new_query_result))
                  {
    ?>
        <div 
          class="container" 
          style="background-image: url(img/movie/<?php echo $row2['image_id'];?>);" 
          onclick="location.href='aboutMovies.php?movie_id=<?php echo $row2['movie_id'];?>'"></div>
    <?php
                    $j++;
                    if($j > 4){
                      break;
                    }
                  }
                }
    ?>
	</div>




	<div>
		<h2 style="background-color: #B8312F; border-radius: 0px 15px 15px 0px;">Editor's Pick<br/> of the Day</h2>
    <?php
      $pick = "2";
      $query = "SELECT * FROM movies where ID = ".$pick;
        $players_query_result = mysqli_query($link, $query) or die(mysql_error());
        if(mysqli_num_rows($players_query_result) > 0)
        {
          while ($row = mysqli_fetch_array($players_query_result))
          {
    ?>

    <div class="containerlarge" style="background-image: url(img/movie/img<?php echo $pick;?>.jpg);"></div>
		<h3><?php echo $row['Title']; ?></h3>
		<h4><?php echo $row['Release_date']; ?></h4>
		<p><?php echo $row['details']; ?></p>

    <?php
          }
        }
    ?>

	</div>



	<script src="JS/scriptHomeV2.js"></script>
  <?php include 'close.php'; ?>
</body>
</html>