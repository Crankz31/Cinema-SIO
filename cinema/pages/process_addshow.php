<?php
    session_start();
    include('../../config.php');
    extract($_POST);

    $time = utf8_decode(addslashes($time));
    $movie = utf8_decode(addslashes($movie));
    $sdate = utf8_decode(addslashes($sdate)); 
    $tid = $_SESSION['theatre'];
    foreach($stime as $time)
    {
        mysqli_query($con,"insert into  tbl_shows values(NULL,'$time','$tid','$movie','$sdate','1','0')");
    }
    $_SESSION['success']="Show Added";
    header('location:add_show.php');
    ?>
    