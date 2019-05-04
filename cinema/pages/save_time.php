<?php
    include('../../config.php');
    extract($_POST);

    $sname = utf8_decode(addslashes($sname));
    $time = utf8_decode(addslashes($time));
    $screen = utf8_decode(addslashes($screen)); 
    $ch = mysqli_query($con, "select * from tbl_show_time where screen_id = ".$screen." and name = '".$sname."' and start_time = '".$time."'");
    $ch2 = mysqli_num_rows($ch);
    if($ch2 == 0)
    {
        mysqli_query($con,"insert into tbl_show_time (screen_id,name,start_time) values('$screen','$sname','$time')");
    }
    
    
    
    
?>