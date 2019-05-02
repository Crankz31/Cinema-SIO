<?php
    session_start();
    include('../../config.php');
    extract($_POST);
    
    $target_dir = "../../images/";
    $target_file = $target_dir . basename($_FILES["image"]["name"]);
    move_uploaded_file($_FILES["image"]["tmp_name"], $target_file);
    $flname="images/".basename($_FILES["image"]["name"]);
    
    //UTF8 FIX
    $name = utf8_decode(addslashes($name));
    $cast = utf8_decode(addslashes($cast));
    $rdate = utf8_decode(addslashes($rdate)); 
    $description = utf8_decode(addslashes($description));
    $flname = utf8_decode(addslashes($flname));
    $tid = $_SESSION['theatre'];
    mysqli_query($con,"insert into  tbl_movie (t_id,movie_name,cast,description,release_date,image,video_url,status) values('$tid','$name','$cast','$description','$rdate','$flname','$video',0)");
    
    $_SESSION['success']="Film ajouté";
    header('location:add_movie.php');
?>