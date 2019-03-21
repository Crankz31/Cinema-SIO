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
  <!-- =============================================== -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Reservations du jour
      </h1>
      <ol class="breadcrumb">
        <li><a href="index.php"><i class="fa fa-home"></i> Accueil</a></li>
        <li class="active">Reservations du jour</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box --> 
      <div class="box">
        <div class="box-body">
          <div class="panel panel-default">
            <div class="panel-body">
              <div class="form-group col-md-6">
                <label class="control-label">Choisir une salle</label>
                <select class="form-control" id="screen">
                  <option value="0">Selectionner une salle</option>
                  <?php
                  $q=mysqli_query($con,"select  * from tbl_screens where t_id='".$_SESSION['theatre']."'");
                  while($th=mysqli_fetch_array($q))
                  {
                    ?>
                    <option value="<?php echo $th['screen_id'];?>"><?php echo $th['screen_name'];?></option>
                    <?php
                  }
                  ?>
                </select>
              </div>
              <div class="form-group col-md-6">
                <label class="control-label">Choisir un film</label>
                <select class="form-control" id="show">
                  <option value="0">Choisir une film</option>
                  
                </select>
              </div>
              
            </div>
          </div>
          <div id="disp"></div>
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
<script>
  $('#screen').change(function(){
    
    screen=$(this).val();
    $.ajax({
			url: 'get_show.php',
			type: 'POST',
			data: 'id='+screen,
			dataType: 'html'
		})
		.done(function(data){
			//console.log(data);	
			$('#show').html(data);    
		})
		.fail(function(){
			$('#screendtls').html('<i class="glyphicon glyphicon-info-sign"></i> Quelque chose n\'a pas m\'arché. Réessayez...');
		  });
		  
  });
  $('#show').change(function(){
    show=$(this).val();
    $.ajax({
			url: 'get_tickets.php',
			type: 'POST',
			data: 'id='+show,
			dataType: 'html'
		})
		.done(function(data){
			//console.log(data);	
			$('#disp').html(data);    
		})
		.fail(function(){
			$('#screendtls').html('<i class="glyphicon glyphicon-info-sign"></i> Quelque chose n\'a pas m\'arché. Réessayez...');
		  });
  });
</script>