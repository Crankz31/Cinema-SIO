<?php
    include('../../config.php');
    extract($_POST);
    
        //UTF8 FIX
        $name = addslashes($name);
        $address = addslashes($address);
        $place = addslashes($place);
        $state = addslashes($state);
        $pin = addslashes($pin);
    
       mysqli_query($con,"insert into  tbl_theatre values(NULL,'$name','$address','$place','$state','$pin')");
     
    $id=mysqli_insert_id($con);
    mysqli_query($con,"insert into  tbl_login values(NULL,'$id','$username','$password','1')");
    header('location:add_theatre_2.php?id='.$id);
?>