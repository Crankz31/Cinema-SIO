<?php
    $host = "127.0.0.1";
    $user = "root";                     //Username
    $pass = "";                                  //Remember, there is NO password by default!
    $db = "sio_cinema";                                  //Your database name you want to connect to
    $port = 3306;
     $con = mysqli_connect($host, $user, $pass, $db, $port)or die(mysql_error());
?>