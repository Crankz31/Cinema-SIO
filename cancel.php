<?php
session_start();
include('config.php');
mysqli_query($con,"delete from tbl_bookings where book_id='".$_GET['id']."'");
$_SESSION['success']="Votre réservation à bien été supprimée.";
header('location:profile.php');
?>