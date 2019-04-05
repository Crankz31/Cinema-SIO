
<?php
session_start();
if(!isset($_SESSION['user']))
{
	header('location:login.php');
}
extract($_POST);
?><!doctype html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0 minimal-ui"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<meta name="apple-mobile-web-app-capable" content="yes"/>
<meta name="apple-mobile-web-app-status-bar-style" content="black">

<meta http-equiv="cache-control" content="max-age=0" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
<meta http-equiv="pragma" content="no-cache" />

<title>GOMB Paiement</title>
<link href="css/bank.css" rel="stylesheet" type="text/css"/>


</head>


<body>

<div id="mainContainer" class="row large-centered">

  <div class="text-center"><h2>Banque</h2></div>
  
  <hr class="divider">
  <dl class="mercDetails">
  	<dt>Marchand</dt> 				<dd>GOMB Cinéma</dd>
    <dt>Montant de la transaction</dt> 	<dd> <?php echo  $_SESSION['amount'];?> EUR</dd>
    <dt>Num carte</dt> 		<dd><?php echo  $number;?></%></dd>
  </dl>
  <hr class="divider">
  
<form name="form1" id="form1" method="post" action="complete_payment.php">
<fieldset class="page2">
<div class="row formInputSection">
<center><button class="expanded button next " onClick="ValidateForm()">Procéder au paiement</button></center>
</div>
<p>
<br>
<a class="tryAgain" href="index.php">Retour au site GOMB</a> 
</p>
</fieldset>


</form>
</div>
<script src="bank/script/jquery-1.9.1.js"></script>
<script>
document.onmousedown = rightclickD; function rightclickD(e) { e = e||event; if (e.button == 2) { alert('Function Disabled...'); return false; } }
function ValidateForm() { document.form1.submit();}
</script>

</body>
</html>