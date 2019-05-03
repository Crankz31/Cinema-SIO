<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<?php
session_start();
if(!isset($_SESSION['user']))
{
	header('location:login.php');
}
include('config.php');
extract($_POST);
$otp=""; // REMOVE TO ENABLE OTP FROM BANK FORM
if($otp=="") // PUT VARIABLE IF YOU WANT ENABLE OTP AUTH
{
    $ticket_id=rand(100,999);
    mysqli_query($con,"insert into tbl_bookings (ticket_id,t_id,user_id,show_id,screen_id,no_seats,amount,ticket_date,date,status) values('$ticket_id','".$_SESSION['theatre']."','".$_SESSION['user']."','".$_SESSION['show']."','".$_SESSION['screen']."','".$_SESSION['seats']."','".$_SESSION['amount']."','".$_SESSION['date']."',CURDATE(),'1')");
    $_SESSION['success']="La réservation a été effectué avec succès.";
}
else
{
    $_SESSION['error']="Paiement échoué.";
}
?>
<body><table align='center'><tr><td><STRONG>Transaction en cours,</STRONG></td></tr><tr><td><font color='blue'>Patientez SVP <i class="fa fa-spinner fa-pulse fa-fw"></i>
<span class="sr-only"></font></td></tr><tr><td>(N'appuyez pas sur le bouton retour ni rafraichir ! )</td></tr></table><h2>
<script>
    setTimeout(function(){ window.location="profile.php"; }, 5000);
</script>