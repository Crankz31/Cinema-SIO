<?php
    include('../../config.php');
    extract($_POST);

    $sname = utf8_decode(addslashes($sname));
    $time = utf8_decode(addslashes($time));
    $screen = utf8_decode(addslashes($screen)); 
    mysqli_query($con,"insert into tbl_show_time (screen_id,name,start_time) values('$screen','$sname','$time')");
    
    
?>