
<?php
    include('config.php');
    extract($_POST);
    mysqli_query($con,"insert into tbl_contact (name,email,mobile,subject) values('$name','$email','$mobile','$subject')");
    header('location:contact.php');
?>