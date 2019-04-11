<?php
include('config.php');
session_start();
date_default_timezone_set('Europe/Paris');

?>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>PROJET CINEMA SIO</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="all" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src='js/jquery.color-RGBa-patch.js'></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="header">
	<div class="header-top">
		<div class="wrap">
			<div class="h-logo">
			<a href="index.php"><img src="images/logo.png" alt=""/></a>

			</div>
            	<nav class="nav-wrap">
					<ul class="group" id="example-one">
			        	<li><a href="index.php">Accueil</a></li>
			  			<li><a href="movies_events.php">Films à l'affiche</a></li>
						<li><a href="contact.php">Contact</a></li>
			  			<li><?php if(isset($_SESSION['user'])){
			  			$us=mysqli_query($con,"select * from tbl_registration where user_id='".$_SESSION['user']."'");
						$user=mysqli_fetch_array($us);?><a href="profile.php"><?php echo $user['name'];?></a><a href="logout.php">Se déconnecter</a><?php }else{?><a href="login.php">Se connecter</a><?php }?></li>
			        </ul>
				</nav>
			
 			<div class="clear"></div>
   		</div>
    </div>
	<div class="clear"></div>
</div>
<script>
function myFunction() {
     if($('#hero-demo').val()=="")
        {
            alert("Entrez le titre du film ...");
            return false;
        }
    else{
        return true;
    }
    
}
</script>