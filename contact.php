<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>PROJET CINEMA SIO</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js'></script>
<script src='js/jquery.color-RGBa-patch.js'></script>
<script src='js/example.js'></script>
</head>
<body>
<div class="header">
	<div class="header-top">
		<div class="wrap">
			<div class="h-logo">
			<a href="index.php"><img src="images/logo.png" alt=""/></a>
		</div>
			  <div class="nav-wrap">
					<ul class="group" id="example-one">
		           <li><a href="index.php">Accueil</a></li>
			  		   <li><a href="movies_events.php">Films à l'affiche</a></li>
			  		   <li class="current_page_item"><a href="contact.php">Contact</a></li>
							 <li><?php if(isset($_SESSION['user'])){
								$us=mysqli_query($con,"select * from tbl_registration where user_id='".$_SESSION['user']."'");
								$user=mysqli_fetch_array($us);?><a href="profile.php"><?php echo $user['name'];?></a><a href="logout.php">Se déconnecter</a><?php }else{?><a href="login.php">Se connecter</a><?php }?></li>
			        </ul>
			  </div>
 			<div class="clear"></div>
   		</div>
    </div>
<div class="content">
	<div class="wrap">
		<div class="content-top">
				<div class="section group">
				<div class="col span_2_of_3">
				  <div class="contact-form">
				  	<h3>Nous contacter</h3>
					    <form action="process_contact.php" method="post" name="form11">
					    	<div>
						    	<span><label>Nom</label></span>
						    	<span><input type="text" value="" required name="name"></span>
						    </div>
						    <div>
						    	<span><label>E-mail</label></span>
						    	<span><input type="text" value="" required name="email"></span>
						    </div>
						    <div>
						     	<span><label>Numéro de téléphone</label></span>
						    	<span><input type="number" value="" required name="mobile"></span>
						    </div>
						    <div>
						    	<span><label>Sujet</label></span>
						    	<span><textarea required name="subect"> </textarea></span>
						    </div>
						   
					    </form>
				  </div>
  				</div>
				<div class="col span_1_of_3">
					<div class="contact_info">
    	 				<h3>Où nous trouver</h3>
					    	  <div class="map">
							   	    <iframe width="100%" height="175" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"  src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2907.3921946187406!2d0.07149691586548569!3d43.22223617913848!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x12a9d4777d5b229f%3A0x9f7d1c13ad55b206!2sLyc%C3%A9e+G%C3%A9n%C3%A9ral+et+Technologique+Marie+Curie!5e0!3m2!1sfr!2sfr!4v1553774177112" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe><br><small><a href="https://maps.google.co.in/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Lighthouse+Point,+FL,+United+States&amp;aq=4&amp;oq=light&amp;sll=26.275636,-80.087265&amp;sspn=0.04941,0.104628&amp;ie=UTF8&amp;hq=&amp;hnear=Lighthouse+Point,+Broward,+Florida,+United+States&amp;t=m&amp;z=14&amp;ll=26.275636,-80.087265" style="color:#666;text-align:left;font-size:12px">View Larger Map</a></small>
							  </div>
      				</div>
      			<div class="company_address">
				     	<h3>Information Société :</h3>
						    	<p>2 Rue George Ledormeur</p>					   		
						<p>Phone: 05.62.91.01.02</p>
				   </div>
				 </div>
			  </div>
				<div class="clear"></div>		
			</div>
	</div>
</div>
<div class="footer">
	<div class="wrap">
			<div class="footer-top">
				<div class="col_1_of_4 span_1_of_4">
					<div class="footer-nav">
		                <ul>
		                  		<li><a href="index.php">Accueil</a></li>
		                    	<li><a href="movies_events.php">Films à l'affiche</a></li>
													<li><a href="contact.php">Contact</a></li>
													<li><a href="login.php">Connexion</a></li>
		                      
		                   </ul>
		              </div>
				</div>
				<div class="col_1_of_4 span_1_of_4">
					<div class="textcontact">
						<p>GOMB CINEMA<br>
						2 Rue George Ledormeur<br>
						65000 Tarbes<br>
					
						</p>
					</div>
				</div>
				<div class="col_1_of_4 span_1_of_4">
					<div class="call_info">
						<p class="txt_3">Appelez nous:</p>
						<p class="txt_4">05.62.91.01.02</p>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
