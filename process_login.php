<?php
include('config.php');
session_start();
$email = $_POST["Email"];
$pass = $_POST["Password"];
$qry=mysqli_query($con,"select * from tbl_login where username='$email' and password='$pass'");
if(mysqli_num_rows($qry))
{
	$usr=mysqli_fetch_array($qry);
	if ($usr['user_type']==2)
	{
		$_SESSION['user']=$usr['user_id'];
		if(isset($_SESSION['show']))
		{
			header('location:booking.php');
		}
		else
		{
			header('location:index.php');
		}
	}
	elseif($usr['user_type']==0)
	{
		$_SESSION['admin']=$usr['id'];
		header('location:admin/pages/index.php');
	}
	elseif ($usr['user_type']==1) 
	{
		$qth=mysqli_query($con,"select * from tbl_theatre where id_log='".$usr['id']."'");
		$uth=mysqli_fetch_array($qth);
		$_SESSION['theatre']=$uth['id'];
		header('location:cinema/pages/index.php');
	}
	else
	{
		$_SESSION['error']="Login Failed!";
		header("location:login.php");
	}
	
}
else
{
	$_SESSION['error']="Login Failed!";
	header("location:login.php");
}
?>