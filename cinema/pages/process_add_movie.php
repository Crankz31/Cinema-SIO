<?php
    session_start();
    include('../../config.php');
    extract($_POST);
    
    $target_dir = "../../images/";
    $target_file = $target_dir . basename($_FILES["image"]["name"]);
    
    $flname="images/".basename($_FILES["image"]["name"]);
    
    mysqli_query($con,"insert into  tbl_movie values(NULL,'".$_SESSION['theatre']."','$name','$cast','$description','$rdate','$flname','$video','0')");
    
    move_uploaded_file($_FILES["image"]["tmp_name"], $target_file);
    
    $_SESSION['success']="Film ajouté";
    header('location:add_movie.php');
?>