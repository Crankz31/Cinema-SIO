<?php
session_start();
include('../../config.php');

$mid=$_GET['mid'];
mysqli_query($con,"delete  from tbl_news where news_id='$mid'");
 $_SESSION['success']="Le film à bien été supprimé !";
header("location:index.php");
?>