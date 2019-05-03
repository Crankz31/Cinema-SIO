
<?php include('header.php');
if(!isset($_SESSION['user']))
{
	header('location:login.php');
}?>
<link rel="stylesheet" href="validation/dist/css/bootstrapValidator.css"/>
    
<script type="text/javascript" src="validation/dist/js/bootstrapValidator.js"></script>
  <!-- =============================================== -->
  <?php
    include('form.php');
    $frm=new formBuilder;      
  ?> 
</div>
<div class="content">
	<div class="wrap">
		<div class="content-top">
			<h3>Paiement</h3>
			<form action="bank.php" method="post" id="form1">
			<div class="col-md-4 col-md-offset-4" style="margin-bottom:50px">
			<div class="form-group">
   <label class="control-label">Nom de paiement</label>
    <input type="text" class="form-control" name="name">
</div>
<div class="form-group">
   <label class="control-label">Numéro de carte</label>
    <input type="text" class="form-control" name="number" required title="Enter 16 digit card number">
  
</div>      
<div class="form-group">
   <label class="control-label">Date d'expiration</label>
    <input type="date" class="form-control" name="date">
</div>
<div class="form-group">
   <label class="control-label">CVV</label>
    <input type="text" class="form-control" name="cvv">
</div>
<div class="form-group">
    <button class="btn btn-success">Proceder au paiement</button>
    </form>
</div>
</div>
			</div>
			
		<div class="clear"></div>	
		
	</div>
<?php include('footer.php');?>
</div>
<?php
    //session_start();
    extract($_POST);
    include('config.php');
    $_SESSION['screen']=$screen;
    $_SESSION['seats']=$seats;
    $_SESSION['amount']=$amount;
    $_SESSION['date']=$date;
    //header('location:bank.php');
?>
<script>
        $(document).ready(function() {
            $('#form1').bootstrapValidator({
            fields: { 
            name: {
            verbose: false,
                validators: {notEmpty: {
                        message: 'Votre nom est obligatoire.'
                    },regexp: {
                        regexp: /^[a-zA-Z ]+$/,
                        message: 'Votre nom ne doit uniquement contenir des lettres'
                    } } },
            number: {
            verbose: false,
                validators: {notEmpty: {
                        message: 'Votre numéro de carte est obligatoire.'
                    },stringLength: {
                    min: 16,
                    max: 16,
                    message: 'Votre numero de carte doit contenir 16 chiffres'
                },regexp: {
                        regexp: /^[0-9 ]+$/,
                        message: 'Entrez un numero de carte valide'
                    } } },
            date: {
            verbose: false,
                validators: {notEmpty: {
                        message: 'La date d\'expiration est obligatoire.' 
                    } } },
            cvv: {
            verbose: false,
                validators: {notEmpty: {
                        message: 'Le CVV est obligatoire'
                    },stringLength: {
                    min: 3,
                    max: 3,
                    message: 'Le CVV doit contenir 3 chiffres.'
                },regexp: {
                        regexp: /^[0-9 ]+$/,
                        message: 'Entrez un CVV valide.'
                    } } }}
            });
            });

</script>