<!DOCTYPE html>
<html>
<head>
    <title>Top Rated Movies</title>
    <link rel="stylesheet"  href="CSS/stylesTopRatedMoviesV2.css">
</head>

<body>

  <?php include 'navbar.php';?>
  <?php include 'config.php';?>

	<div class="wrapper aligned">

  		<div class="box itema">
 			<h3> Best Movies: 2017 </h3>
  			<table>
        <?php
            $query = "SELECT title, rating, release_Date from movies where release_Date between '2017-01-01' and '2017-08-10' order by rating desc";
            $players_query_result = mysqli_query($link, $query) or die(mysql_error());
            $i = 0;
            if(mysqli_num_rows($players_query_result) > 0 )
            {
                while ($row = mysqli_fetch_array($players_query_result))
                {
                
        ?>
  				<tr>
  					<td><?php echo $row['rating']; ?></td><td><?php echo $row['title']; ?></td>
  				</tr>
        <?php
          $i++;
            if($i > 4){
              break;
            }
            }
          }
        ?>
  			</table>
  		</div>

  			
  		<div class="box itemb">
  			<h3> Best Movies: All Time </h3>
        <table>
        <?php
            $query = "SELECT title, rating, release_Date from movies order by rating desc";
            $players_query_result = mysqli_query($link, $query) or die(mysql_error());
            $i = 0;
            if(mysqli_num_rows($players_query_result) > 0 )
            {
                while ($row = mysqli_fetch_array($players_query_result))
                {
                
        ?>
          <tr>
            <td><?php echo $row['rating']; ?></td><td><?php echo $row['title']; ?></td>
          </tr>
        <?php
          $i++;
            if($i > 4){
              break;
            }
            }
          }
        ?>
        </table>
  		</div>

  		<div class="box itemc">
  			<h3> Best Movies: 2016 </h3>
        <table>
        <?php
            $query = "SELECT title, rating, release_Date from movies where release_Date between '2016-01-01' and '2016-12-31' order by rating desc";
            $players_query_result = mysqli_query($link, $query) or die(mysql_error());
            $i = 0;
            if(mysqli_num_rows($players_query_result) > 0 )
            {
                while ($row = mysqli_fetch_array($players_query_result))
                {
                
        ?>
          <tr>
            <td><?php echo $row['rating']; ?></td><td><?php echo $row['title']; ?></td>
          </tr>
        <?php
          $i++;
            if($i > 4){
              break;
            }
            }
          }
        ?>
        </table>
  		</div>

  		<div class="box itemd">
	  			<h3> Best Movies: 2015 </h3>
          <table>
        <?php
            $query = "SELECT title, rating, release_Date from movies where release_Date between '2015-01-01' and '2015-12-31' order by rating desc";
            $players_query_result = mysqli_query($link, $query) or die(mysql_error());
            $i = 0;
            if(mysqli_num_rows($players_query_result) > 0 )
            {
                while ($row = mysqli_fetch_array($players_query_result))
                {
                
        ?>
          <tr>
            <td><?php echo $row['rating']; ?></td><td><?php echo $row['title']; ?></td>
          </tr>
        <?php
          $i++;
            if($i > 4){
              break;
            }
            }
          }
        ?>
        </table>
  		</div>

  		<div class="box iteme">
				<h3> Best Movies: 2014 </h3>
        <table>
        <?php
            $query = "SELECT title, rating, release_Date from movies where release_Date between '2014-01-01' and '2014-12-31' order by rating desc";
            $players_query_result = mysqli_query($link, $query) or die(mysql_error());
            $i = 0;
            if(mysqli_num_rows($players_query_result) > 0 )
            {
                while ($row = mysqli_fetch_array($players_query_result))
                {
                
        ?>
          <tr>
            <td><?php echo $row['rating']; ?></td><td><?php echo $row['title']; ?></td>
          </tr>
        <?php
          $i++;
            if($i > 4){
              break;
            }
            }
          }
        ?>
        </table>
  		</div>

  	</div>
    <?php include 'close.php'; ?>
</body>
</html>