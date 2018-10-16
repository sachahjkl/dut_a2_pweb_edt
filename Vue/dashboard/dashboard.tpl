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

		<a class="btn btn-primary" href="./index.php?controle=info_usr&action=load">Information Utilisateur</a>
		<a class="btn btn-danger" href="./index.php?controle=choix_type_util&action=disconnect"  >Déconnexion</a>
		<!-- <?php require("./Vue/dashboard/edth.tpl")?> -->

		<!-- <?php require("./Vue/dashboard/menu.tpl")?> -->

		<!-- <div class="vertical-center cardbox card bg-light mb-3" style="margin: 20em 5em 0 5em ;"> 
			<div class="card-header">
				Informations concernant l'utilisateur
			</div>
			<div class="card-text table-responsive">
				<?php
					echo("<table class='table d-flex'><tr>");
					foreach($_SESSION['profil'] as $key => $value){
						echo ("<th>". utf8_encode($key) ."</th>");
					}
					echo"</tr><tr>";
					foreach($_SESSION["profil"] as $key => $value){
						echo ("<td>". utf8_encode($value) ."</td>");
					}
					echo("</tr></table>");
				?>
			</div>
		</div> -->
</body>