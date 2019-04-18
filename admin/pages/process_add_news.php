<?php

 

    session_start();
    include('../../config.php');
    extract($_POST);
       $uploaddir = '../news_images/';
      $uploadfile = $uploaddir . basename($_FILES['attachment']['name']);
    move_uploaded_file($_FILES['attachment']['tmp_name'],$uploadfile);
    $flname="news_images/".basename($_FILES["attachment"]["name"]);

    //UTF8 FIX
    $name = addslashes($name);
    $cast = addslashes($cast);
    $date = addslashes($date);
    $description = addslashes($description);
    $flname = addslashes($flname);


    mysqli_query($con,"insert into tbl_news values(NULL,'$name','$cast','$date','$description','$flname')");
    $_SESSION['success']="Film ajouté avec succés !";
    header('location:add_movie_news.php');
?>