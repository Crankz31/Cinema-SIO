
<?php
    include('config.php');
    extract($_POST);
   mysqli_query($con,"insert into tbl_contact values(NULL,'$name','$email','$mobile','$subject')");
    header('location:contact.php');
?>