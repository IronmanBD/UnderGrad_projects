
  <?php 
  			include 'config.php';

        	if($_SERVER["REQUEST_METHOD"] == "POST"){
				session_start();
                if(!isset($_SESSION['id']) || empty($_SESSION['id'])){
                    header("location: Signupandlogin.php");
                }else{
	        		$user_id = $_SESSION['id'];
	        		$movie_id = $_POST["movie_select"];
	        		$review = $_POST["reviewing_place"];


                	$sql = "INSERT INTO reviewers_review_movies (reviewer_id, movie_id, review) VALUES (?, ?, ?)";

                	if($stmt = mysqli_prepare($link, $sql)){
                		mysqli_stmt_bind_param($stmt, "iis", $param_user_id, $param_movie_id, $param_review);

	                    $param_user_id = $user_id;
	                    $param_movie_id = $movie_id;
	                    $param_review = $review;

	                    if(mysqli_stmt_execute($stmt)){
	                    	echo '<script language="javascript">';
			  				echo 'alert("Account Successfully Created!!")';
			  				echo '</script>';
		                    header("location: reviewers.php");
	                    }
	                    mysqli_stmt_close($stmt);
                	}
                }
        	}
  			include 'close.php'; 
  ?>