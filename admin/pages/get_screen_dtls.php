 <?php
 include('../../config.php');
    $sr=mysqli_query($con,"select * from tbl_screens where t_id='".$_POST['id']."'");
    if(mysqli_num_rows($sr))
    {
  ?>
    <table class="table table-bordered table-hover">
      <th class="col-md-1">Salle Num</th>
      <th class="col-md-3">Nom de la salle</th>
      <th class="col-md-1">Sièges</th>
      <th class="col-md-1">Prix</th>
      <th class="col-md-3">Heure du film</th>
      <th class="text-right col-md-3"><button data-toggle="modal" data-target="#view-modal" id="getUser" class="btn btn-sm btn-info"><i class="fa fa-plus"></i> Ajouter une salle</button></th>
        <?php 
        $sl=1;
        while($screen=mysqli_fetch_array($sr))
        {
          ?>
          <tr>
            <td><?php echo $sl;?></td>
            <td><?php echo $screen['screen_name'];?></td>
            <td><?php echo $screen['seats'];?></td>
            <td><?php echo $screen['charge'];?></td>
            <?php 
              $st=mysqli_query($con,"select * from tbl_show_time where screen_id='".$screen['screen_id']."'");
            ?>
            <td><?php if(mysqli_num_rows($st)) { while($stm=mysqli_fetch_array($st))
            { echo date('H:i ',strtotime($stm['start_time']))." ,";}}
            else
            {echo "Aucune séance ajouté";}
            ?></td>
            <td class="text-right"><button data-toggle="modal" data-id="<?php echo $screen['screen_id'];?>" data-target="#view-modal2" id="getUser2" class="btn btn-sm btn-warning"><i class="fa fa-plus"></i> Ajouter une séance</button></td>
          </tr>
          <?php
          $sl++;
        }
        ?>
    </table>
    <?php
    }
    else
    {
      ?>
      <button data-toggle="modal" data-target="#view-modal" id="getUser" class="btn btn-sm btn-info"><i class="fa fa-plus"></i> Ajouter un écran</button>
      <?php
    }
    ?>