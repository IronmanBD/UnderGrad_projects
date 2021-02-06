<!DOCTYPE html>
<html>

<head>

	<title>Reviewers</title>

	<link rel="stylesheet" href="CSS/cinetophiliaTheme.css">
	<link rel="stylesheet" href="CSS/stylesReviewers.css">
	
</head>

<body>

	<?php include 'navbar.php';?>
  	<?php include 'config.php';?>
	
	<h2>Top Reviewers</h2>

	<table>
		<colgroup>
       		<col span="1" style="width: 30%;">
       		<col span="1" style="width: 70%;">
    	</colgroup>

    	<?php
      			$query = "SELECT * FROM reviewers ORDER BY rating DESC";
        		$players_query_result = mysqli_query($link, $query) or die(mysql_error());
        		$i = 0;
        		if(mysqli_num_rows($players_query_result) > 0 )
        		{
          			while ($row = mysqli_fetch_array($players_query_result))
          			{
    	?>

		<tr valign="Top">
			<td rowspan="2" align="right">
				<div class="userpic" style="background-image: url(img/user/<?php echo $row['img_id']; ?>);"></div>
			</td>
			<td>
				<h3><?php echo $row['user_name'] ?></h3>
				<?php include 'starRating.php';?>
			</td>
		</tr>
		<tr>
			<td>
				<table>

				<?php
	      			$newquery = "SELECT rrm.reviewer_id, m.title, rrm.review FROM reviewers_review_movies AS rrm INNER JOIN movies AS m ON m.id = rrm.movie_id WHERE rrm.reviewer_id = ".$row['r_id'];
	        		$new_query_result = mysqli_query($link, $newquery) or die(mysql_error());
	        		$j = 0;
	        		if(mysqli_num_rows($new_query_result) > 0)
	        		{
	          			while ($row2 = mysqli_fetch_array($new_query_result))
	          			{
    			?>

					<tr>
						<h4><?php echo $row2['title']; ?></h4>
					</tr>
					<tr>
						<p><?php echo $row2['review']; ?></p>
					</tr>

				<?php
							$j++;
							if($j > 2){
								break;
		          			}
		          		}
		          	}
    			?>

				</table>
			</td>
		</tr>

		<?php
				$i++;
				if($i > 2){
					break;
          			}
				}
        		}
    	?>

	</table>

	<h2>Your Review</h2>

	<form action="insert.php" method="post">
		<select name="movie_select">
			<?php
			      			$newquery = "select id, title from movies";
			        		$new_query_result = mysqli_query($link, $newquery) or die(mysql_error());
			        		$j = 0;
			        		if(mysqli_num_rows($new_query_result) > 0)
			        		{
			          			while ($row2 = mysqli_fetch_array($new_query_result))
			          			{
		    ?>

		  		<option value="<?php echo $row2['id']; ?>"><?php echo $row2['title'];?></option>

		  	<?php
									$j++;
				          		}
				          	}
		    ?>
		</select>
		<textarea rows="10" cols="80" class="searchTerm" name="reviewing_place" placeholder="Write your Review here"></textarea>
    	<input type="submit" class="searchButton" name="submit" value="Submit">
	</form>	


  <?php include 'close.php'; ?>
</body>

</html>