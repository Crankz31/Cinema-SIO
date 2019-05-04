<?php
include('header.php');
include('../../msgbox.php');
?>
  <!-- =============================================== -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Information du cinéma
      </h1>
      <ol class="breadcrumb">
        <li><a href="index.php"><i class="fa fa-home"></i> Accueil</a></li>
        <li class="active">Information du cinéma</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box --> 
      <div class="box">
         <div class="box-header with-border">
              <h3 class="box-title">Informations générale</h3>
            </div>
        <div class="box-body">
          <?php $th=mysqli_query($con,"select * from tbl_theatre where id='".$_SESSION['theatre']."'");
            $theatre=mysqli_fetch_array($th); ?>
            <table class="table table-bordered table-hover">
                <tr>
                    <td class="col-md-6">Nom du cinéma</td>
                    <td  class="col-md-6"><?php echo $theatre['name'];?></td>
                </tr>
                <tr>
                    <td>Adresse du cinéma</td>
                    <td><?php echo $theatre['address'];?></td>
                </tr>
                <tr>
                    <td>Ville</td>
                    <td><?php echo $theatre['place'];?></td>
                </tr>
                <tr>
                    <td>Département</td>
                    <td><?php echo $theatre['state'];?></td>
                </tr>
                <tr>
                    <td>Code Postal</td>
                    <td><?php echo $theatre['pin'];?></td>
                </tr>
            </table>
        </div> 
        <!-- /.box-footer-->
      </div>
         <div class="box">
         <div class="box-header with-border">
              <h3 class="box-title">Informations des salles</h3>
            </div>
        <div class="box-body" id="screendtls">
        <?php
            $sr=mysqli_query($con,"select * from tbl_screens where t_id='".$_SESSION['theatre']."'");
            if(mysqli_num_rows($sr))
            {
          ?>
            <table class="table table-bordered table-hover">
              <th class="col-md-3">Nom de la salle</th>
              <th class="col-md-1">Sièges</th>
              <th class="col-md-1">Prix</th>
              <th class="col-md-3">Heure des séances</th>
              <th class="text-right col-md-3"><button data-toggle="modal" data-target="#view-modal" id="getUser" class="btn btn-sm btn-info"><i class="fa fa-plus"></i> Ajouter une salle</button></th>
                <?php 

                while($screen=mysqli_fetch_array($sr))
                {
                  ?>
                  <tr>
                    <td><?php echo $screen['screen_name'];?></td>
                    <td><?php echo $screen['seats'];?></td>
                    <td><?php echo $screen['charge'];?></td>
                    <?php 
                    $ch = mysqli_query($con, "select * from tbl_show_time where screen_id = 1 and name = 'Après-midi' and start_time = '15:00:00'");
                    $ch2 = mysqli_num_rows($ch);
                    ?>
                    <td><?php echo "nb :". $ch2. ".";?></td>
                    <?php 
                      $st=mysqli_query($con,"select * from tbl_show_time where screen_id='".$screen['screen_id']."'");
                    ?>
                    <td><?php if(mysqli_num_rows($st)) { while($stm=mysqli_fetch_array($st))
                                  { echo date('H:i a',strtotime($stm['start_time']))." ,";}}
                              else
                                  {echo "No Show Time Added";}?>
                    </td>
                    
                    <td class="text-right"><button data-toggle="modal" data-id="<?php echo $screen['screen_id'];?>" data-target="#view-modal2" id="getUser2" class="btn btn-sm btn-warning"><i class="fa fa-plus"></i> Ajouter une séance </button></td>
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
              <button data-toggle="modal" data-target="#view-modal" id="getUser" class="btn btn-sm btn-info"><i class="fa fa-plus"></i> Ajouter une salle</button>
                    
              <?php
            }
            ?>
        </div> 
        <!-- /.box-footer-->
      </div>
       <div id="view-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
             <div class="modal-dialog"> 
                  <div class="modal-content"> 
                  
                       <div class="modal-header"> 
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">
                            	<i class="fa fa-plus"></i> Ajouter une salle
                            </h4> 
                       </div> 
                       <div class="modal-body"> 
                       
                       	   <div id="modal-loader" style="display: none; text-align: center;">
                       	   	<img src="ajax-loader.gif">
                       	   </div>
                            
                           <!-- content will be load here -->                          
                           <div id="dynamic-content"></div>
                             
                        </div> 
                        <div class="modal-footer"> 
                             
                        </div> 
                        
                 </div> 
              </div>
       </div>
       <div id="view-modal2" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
             <div class="modal-dialog"> 
                  <div class="modal-content"> 
                  
                       <div class="modal-header"> 
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">
                            	<i class="fa fa-plus"></i> Ajouter un créneaux horaire
                            </h4> 
                       </div> 
                       <div class="modal-body"> 
                           <div class="form-group">
                       	     <label class="control-label">Selectionner un créneaux horaire</label>
                       	     <select name="s_name" id="s_name" class="form-control">
                       	       <option value="0">Selectionner un créneaux horaire</option>
                       	       <option>Matin</option>
                       	       <option>Dejeuner</option>
                       	       <option>Après-midi</option>
                       	       <option>Soirée</option>
                       	       <option>Autres</option>
                       	     </select>
                       	   </div>
                       	   <div class="form-group">
                       	     <label class="control-label">Heure de début de la séance</label>
                       	     <input type="time" id="s_time" class="form-control"/>
                       	   </div>
                       	   <div class="form-group">
                            <button class="btn btn-success" id="savetime">Enregistrer</button>
                          </div>
                        </div> 
                        <div class="modal-footer"> 
                             
                        </div> 
                        
                 </div> 
              </div>
       </div>
    </section>
    <!-- /.content -->
  </div>
  <?php
include('footer.php');
?>
<script type="text/javascript">
  var screenid;
  function loadScreendtls()
  {
    $.ajax({
			url: 'get_screen_dtls.php',
			type: 'POST',
			data: 'id='+<?php echo $_SESSION['theatre'];?>,
			dataType: 'html'
		})
		.done(function(data){
			//console.log(data);	
			$('#screendtls').html(data);    
		})
		.fail(function(){
			$('#screendtls').html('<i class="glyphicon glyphicon-info-sign"></i> Something went wrong, Please try again...');
		  });
  }
  $(document).ready(function(){ // load dynamic bootstrap model
	
	  $(document).on('click', '#getUser', function(e){
		
  		e.preventDefault();
  		
  		$('#dynamic-content').html(''); // leave it blank before ajax call
  		$('#modal-loader').show();      // load ajax loader
  		
  		$.ajax({
  			url: 'add_screen_form.php',
  			type: 'POST',
  			data: 'id='+<?php echo $_SESSION['theatre'];?>,
  			dataType: 'html'
  		})
  		.done(function(data){
  			console.log(data);	
  			$('#dynamic-content').html('');    
  			$('#dynamic-content').html(data); // load response 
  			$('#modal-loader').hide();		  // hide ajax loader	
  		})
  		.fail(function(){
  			$('#dynamic-content').html('<i class="glyphicon glyphicon-info-sign"></i> Something went wrong, Please try again...');
  			$('#modal-loader').hide();
  		});
  		
  	});
	
});
$(document).on('click', '#savescreen', function(){
  name=$('#sname').val();
  seats=$('#sseats').val();
  charge=$('#scharge').val();
  if(name=="" && seats=="" && charge=="")
  {
    alert("Enter Correct Details");
  }
  else if(seats=="" && name=="")
  {
    alert("Enter Correct Details");
  }
  else if(charge=="" && name=="")
  {
    alert("Enter Correct Details");
  }
  else if(charge=="" && seats=="")
  {
    alert("Enter Correct Details");
  }
  else if(charge=="")
  {
    alert("Enter Correct Details");
  }
   else if(seats=="")
  {
    alert("Enter Correct Details");
  }
   else if(name=="")
  {
    alert("Enter Correct Details");
  }
  else
  {
    $.ajax({
  			url: 'save_screen.php',
  			type: 'POST',
  			data: 'theatre='+<?php echo $_SESSION['theatre'];?>+'&name='+name+'&charge='+charge+'&seats='+seats,
  			dataType: 'html'
  		})
  		.done(function(data){
  			loadScreendtls();
  			$('#view-modal').modal('toggle');
  		})
  		.fail(function(){
  			loadScreendtls();
  			$('#view-modal').modal('toggle');
  		});
  }
  
});

$(document).on('click', '#getUser2', function(e){

    screenid=$(this).data("id");//screen id
});
$('#savetime').click(function(){
  s_time=$('#s_time').val();
  s_name=$('#s_name').val();
  if(s_time=="" && s_name=="0")
  {
    alert("Enter valid details");
  }
  else if(s_time=="")
  {
      alert("Enter valid details");
  }
  else if(s_name=="0")
  {
      alert("Enter valid details");
  }
  else
  {
    $.ajax({
  		url: 'save_time.php',
  		type: 'POST',
  		data: 'screen='+screenid+'&time='+s_time+'&sname='+s_name,
  		dataType: 'html'
  	})
  	.done(function(data){
  		loadScreendtls();
  		$('#s_time').val('');
  		$('#s_name').val('0');
  		$('#view-modal2').modal('toggle');
  	})
  	.fail(function(){
  		loadScreendtls();
  		$('#view-modal2').modal('toggle');
  	});
  }
  
});
</script>