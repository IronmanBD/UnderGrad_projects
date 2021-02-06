
<?php
  
        include 'config.php';

        $email = $password = "";
        $email_err = $password_err = "";

        if($_SERVER["REQUEST_METHOD"] == "POST"){

            $email = trim($_POST["email"]);
            if(empty($email)){
                $email_err = 'Please enter email.';
            }

            $password = trim($_POST['password']);
            if(empty($password)){
                $password_err = 'Please enter your password.';
            }

            if(empty($email_err) && empty($password_err)){
                $sql = "SELECT r_id FROM reviewers WHERE email = ? and password = ?";

                if($stmt = mysqli_prepare($link, $sql)){
                    mysqli_stmt_bind_param($stmt, "ss", $param_email, $param_password);

                    $param_email = $email;
                    $param_password = $password;

                    if(mysqli_stmt_execute($stmt)){
                        mysqli_stmt_store_result($stmt);
                        if(mysqli_stmt_num_rows($stmt) == 1){
                            mysqli_stmt_bind_result($stmt, $col1);
                            while (mysqli_stmt_fetch($stmt)) {
                                session_start();
                                $_SESSION['id'] = $col1;
                                header("location: home.php");
                            }
                        }else{
                            $password_err = 'The password you entered was not valid.';
                        }
                    }
                    mysqli_stmt_close($stmt);
                }
            }
        }


        include 'close.php'; 
?>


<!DOCTYPE html>
<html>
<head>
	<title>Signup and login</title>
	<link rel="stylesheet" href="CSS/stylesSignUp.css">

</head>
<body>

	
  <?php include 'navbar.php';?>
  <?php include 'config.php';?>


	<div class="box">
  <div id="header">
  <div id="cont-lock"><i class="material-icons lock">SignUp</i></div>
  </div> 
   <form action="" method="get">
    <div class="group">      
      <input class="inputMaterial" type="text" name="name" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Username</label>
    </div>
    <div class="group">      
      <input class="inputMaterial" type="email" name="email" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Enter Email</label>
    </div>
      <div class="group">      
      <input class="inputMaterial" type="password" name="password" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Password</label>
    </div>
    <div class="group">      
      <input class="inputMaterial" type="password" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Confirm Password</label>
    </div>
    <button id="buttonlogintoregister" type="submit">Signup</button>
  </form>
  <div id="footer-box"><p class="footer-text"></div>

</div>
	
  <div class="box">
  <div id="header">
  <div id="cont-lock"><i class="material-icons lock">Login</i></div>
  </div> 
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
   <form action="" method="post">
    <div class="group">      
      <input class="inputMaterial" type="email" name="email" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Email</label>
    </div>
      <div class="group">      
      <input class="inputMaterial" type="password" name="password" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Password</label>
    </div>
    <button id="buttonlogintoregister" type="submit">Login</button>
  </form>
  <div id="footer-box"><p class="footer-text">Not a member?<span class="sign-up"> Sign up now</span></p></div>
</div>



  <?php include 'close.php'; ?>

</body>
</html>