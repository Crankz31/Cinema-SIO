<?php
include('header.php');
?>
  <!-- =============================================== -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Films du jour
      </h1>
      <ol class="breadcrumb">
        <li><a href="index.php"><i class="fa fa-home"></i> Accueil</a></li>
        <li class="active">Films du jour</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box --> 
      <div class="box">
         <div class="box-header with-border">
              <h3 class="box-title">Films disponibles</h3>
            </div>
        <div class="box-body">
          <?php
          $sw=mysqli_query($con,"select * from tbl_shows where st_id in(select st_id from tbl_show_time where screen_id in(select screen_id from  tbl_screens where t_id='".$_SESSION['theatre']."')) and status='1' and r_status='1'");
          if(mysqli_num_rows($sw))
          {?>
            <table class="table">
              <th class="col-md-1">
                ID séance
              </th>
              <th class="col-md-2">
                Nom de la salle
              </th>
              <th class="col-md-3">
                Heure de la séance
              </th>
              <th class="col-md-3">
                Nom du film
              </th>
              <?php
              $sl=1;
              while($shows=mysqli_fetch_array($sw))
              {
                ?>
                <tr>
                  <td>
                    <?php echo $sl; $sl++;?>
                  </td>
                  <?php
                  $st=mysqli_query($con,"select * from tbl_show_time where st_id='".$shows['st_id']."'");
                  $show_time=mysqli_fetch_array($st);
                  $sr=mysqli_query($con,"select * from tbl_screens where screen_id='".$show_time['screen_id']."'");
                  $screen=mysqli_fetch_array($sr);
                  $mv=mysqli_query($con,"select * from tbl_movie where movie_id='".$shows['movie_id']."'");
                  $movie=mysqli_fetch_array($mv);
                  ?>
                  <td>
                    <?php echo $screen['screen_name'];?>
                  </td>
                  <td>
                    <?php echo date('H:i ',strtotime($show_time['start_time']))." ( ".utf8_encode($show_time['name'])." ) ";?>
                  </td>
                  <td>
                    <?php echo utf8_encode($movie['movie_name']);?>
                  </td>
                </tr>
                <?php
              }
              ?>
            </table>
            <?php
          }
          else
          {
            ?>
            <h3>Pas de films ajoutés.</h3>
            <?php
          }
          ?>
        </div> 
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>
  <?php
include('footer.php');
?>