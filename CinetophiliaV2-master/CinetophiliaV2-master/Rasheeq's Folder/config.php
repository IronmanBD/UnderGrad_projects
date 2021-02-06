<?php
	$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "cinetophilia_database";
	// Create connection

	$link = mysqli_connect($servername, $username, $password,$dbname);

	if (mysqli_connect_errno()) {
	    printf("Connect failed: %s\n", mysqli_connect_error());
	    exit();
	}

?>