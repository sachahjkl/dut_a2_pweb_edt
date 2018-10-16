<!doctype html>
<html lang='fr'>
<head>
	<meta charset='utf-8'>
	<title>Connexion d'un <?php echo $nom_type ?></title>
	<link rel='stylesheet' href='./Bootstrap/css/bootstrap.css'>
	<link rel='stylesheet' href='./Vue/style/all.css'>
	<script src='./Bootstrap/js/bootstrap.min.js'></script>
</head>
<body class="calendar_back">

	<div class = "container">

		<div class=" cardbox 	card bg-light mb-3"> 
			<div class="card-header">
				Image de l'utilisateur
			</div>
			<div class="card-text table-responsive">
				sfsdf
				<?php
					if($_SESSION['profil']['urlPhoto'] == ''){
					echo utf8_encode();
				}
				?>
			</div>
		</div>

	</div>

<body>
