 <?php
 include('../../config.php');
    $sr=mysqli_query($con,"SELECT * FROM tbl_show_time WHERE screen_id = ".$_POST['screen']." and st_id NOT IN (SELECT tbl_shows.st_id FROM tbl_shows , tbl_screens where tbl_shows.theatre_id = tbl_screens.t_id and tbl_screens.screen_id=".$_POST['screen'].")");

    if(mysqli_num_rows($sr))
    {
        while($time=mysqli_fetch_array($sr))
        {
            ?>
            <option value="<?php echo $time['st_id'];?>"><?php echo utf8_encode($time['name'])."( ".$time['start_time']." )";?></option>
            <?php
        }
    }
    else {
        ?>
        <option disabled>Aucun horaire ajouté</option>
        <?php
    }
    ?>