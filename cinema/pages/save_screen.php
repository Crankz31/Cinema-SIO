<?php
    include('../../config.php');
    extract($_POST);

    $name = utf8_decode(addslashes($name));
    $theatre = utf8_decode(addslashes($theatre));
    $seats = utf8_decode(addslashes($seats));
    $charge = utf8_decode(addslashes($charge));

    mysqli_query($con,"insert into tbl_screens values(NULL,'$theatre','$name','$seats','$charge')");
?>