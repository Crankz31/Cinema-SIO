<?php

 

    session_start();
    include('../../config.php');
    extract($_POST);
       $uploaddir = '../news_images/';
      $uploadfile = $uploaddir . basename($_FILES['attachment']['name']);
    move_uploaded_file($_FILES['attachment']['tmp_name'],$uploadfile);
    $flname="news_images/".basename($_FILES["attachment"]["name"]);

    //UTF8 FIX
    $name = utf8_decode(addslashes($name));
    $cast = utf8_decode(addslashes($cast));
    $date = utf8_decode(addslashes($date));
    $description = utf8_decode(addslashes($description));
    $flname = utf8_decode(addslashes($flname));


    mysqli_query($con,"insert into tbl_news values(NULL,'$name','$cast','$date','$description','$flname')");
    $_SESSION['success']="Film ajouté avec succés !";
    header('location:add_movie_news.php');
?>