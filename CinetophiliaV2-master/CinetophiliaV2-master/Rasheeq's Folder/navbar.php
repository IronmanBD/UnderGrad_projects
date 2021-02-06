<!DOCTYPE html>
<html>
<head>
  
  <title></title>

  <link rel="stylesheet" href="CSS/navbar.css">

</head>
<body>
<header>
      <h1>Cinetophilia</h1>
      <ul>
        <li>

          <?php
                session_start();
                if(!isset($_SESSION['id']) || empty($_SESSION['id'])){
                    ?>
                    <a href="Signupandlogin.php">Login</a>
                    <?php
                }else{
                    ?>
                    <div class="dropdown">
                        <div class="container2" style="background-image: url(img/user/img<?php echo $_SESSION['id'];?>.jpg);"></div>
                        <div class="dropdown-content">
                            <a href="logout.php">Logout</a>
                        </div>
                    </div>
                    <?php
                }
          ?>
        </li>
        <li><a href="upcoming.php">Upcoming</a></li>
        <li>
          <div class="dropdown">
              <button class="dropbtn" onclick="location.href='topRated.php'">Top Rated</button>
              <div class="dropdown-content">
                  <a href="topGenre.php">Action</a>
              </div>
          </div>
        </li>
        <li><a href="reviewers.php">Reviewers</a></li>
        <li><a href="home.php">Home</a></li>
      </ul>
</header>
</body>
</html>