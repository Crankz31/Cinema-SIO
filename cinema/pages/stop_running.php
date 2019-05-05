<?php
session_start();
include('../../config.php');
extract($_GET);
mysqli_query($con,"update tbl_shows set status='0', r_status='0' where s_id='$id'");
$_SESSION['success']="Séance supprimé !";
header('location:view_shows.php');?>