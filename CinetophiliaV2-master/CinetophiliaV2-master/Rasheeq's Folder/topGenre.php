<!DOCTYPE html>
<html>
  <head>
    <title>Top Action Movies</title>
    <link rel="stylesheet" type="text/css" href="CSS/stylesTopActionV2.css">
    <link rel="stylesheet" href="CSS/navbar.css">
  </head>
<body>


  <?php include 'navbar.php';?>
  <?php include 'config.php';?>

  <h2 style="background-color: #B8312F; border-radius:0 15px 15px 0;">Top 50 Action Movies</h2>

<table>
  <tr>
    <th>Rank</th>
    <th>Ratings</th>
    <th>Movie</th>
    <th>Total Reviews</th>
  </tr>
  <?php
            $query = "select m.title, m.rating, mhg.genre_id, g.genre_type, count(rrm.reviewer_id) as total_review from movies as m inner join movies_has_genre as mhg on m.ID = mhg.movies_id inner join genre as g on g.genre_id = mhg.genre_id inner join reviewers_review_movies as rrm on m.id = rrm.movie_id where g.genre_id = 1 group by (m.id) order by rating desc";
            $players_query_result = mysqli_query($link, $query) or die(mysql_error());
            $i = 0;
            if(mysqli_num_rows($players_query_result) > 0 )
            {
                while ($row = mysqli_fetch_array($players_query_result))
                {$i++;
                
  ?>

  <tr>
    <td><?php echo $i ?>.</td>
    <td><?php echo $row['rating']; ?></td>
    <td><?php echo $row['title']; ?></td>
    <td><?php echo $row['total_review']; ?></td>
  </tr>
  
  <?php
            }
          }
  ?>

</table>
<?php include 'close.php'; ?>
</body>
</html>