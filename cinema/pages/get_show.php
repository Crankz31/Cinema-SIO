<?php
    extract($_POST);
    include('../../config.php');
    $w=mysqli_query($con,"select * from tbl_show_time where screen_id='$id'");
    ?>
    <option value="0">Selectionner un créneau</option>
    <?php
    while($sh=mysqli_fetch_array($w))
    {
        ?>
        <option value="<?php echo $sh['st_id'];?>"><?php echo utf8_encode($sh['name']);?></option>
        <?php
    }
?>