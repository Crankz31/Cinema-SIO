<?php
include('header.php');
?>
<link rel="stylesheet" href="../../validation/dist/css/bootstrapValidator.css"/>
    
<script type="text/javascript" src="../../validation/dist/js/bootstrapValidator.js"></script>
  <!-- =============================================== -->
  <?php
    include('../../form.php');
    $frm=new formBuilder;      
  ?>    

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Messagerie du formulaire de contact
      </h1>
      <ol class="breadcrumb">
        <li><a href="index.php"><i class="fa fa-home"></i> Accueil</a></li>
        <li class="active">Messagerie</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box --> 
      <div class="box">
        <div class="box-body">
  <table class="table">
            <th>
                Contact ID
            </th>
            <th>
                Nom du contact
            </th>
            <th>
                Email du contact
            </th>
            <th>
                Téléphone
            </th>
            <th>
                Message
            </th>
        <?php
    $sl=1;
    include('../../config.php');
    $res=mysqli_query($con,"select * from tbl_contact");    
        ?>
        <?php while($contct=mysqli_fetch_array($res)): ?>   
        <tr>
            <td><?php echo $contct['contact_id'];?></td>
            <td><?php echo $contct['name'];?></td>
            <td><?php echo $contct['email'];?></td>
            <td><?php echo $contct['mobile'];?></td>
            <td><?php echo $contct['subject'];?></td>
        </tr>
        <?php endwhile; ?>
    </table>
<script>
function del(m)
    {
        if (confirm("Etes vous sur de vouloir supprimer ce film?") == true) 
        {
            window.location="process_delete_movie.php?mid="+m;
        } 
    }
    </script>
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