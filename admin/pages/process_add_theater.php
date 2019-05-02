<?php
    include('../../config.php');
    extract($_POST);
    
        //UTF8 FIX
        $name = addslashes($name);
        $address = addslashes($address);
        $place = addslashes($place);
        $state = addslashes($state);
        $pin = addslashes($pin);
    
    mysqli_query($con,"insert into  tbl_login (username,password,user_type) values('$username','$password','1')");
    $id=mysqli_insert_id($con);
    mysqli_query($con,"insert into  tbl_theatre (name,address,place,state,pin,id_log) values('$name','$address','$place','$state','$pin','$id')");
     
    
    
    header('location:add_theatre_2.php?id='.$id);
?>