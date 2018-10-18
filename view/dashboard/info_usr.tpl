<!doctype html>
<html lang='fr'>
	<head>
		<meta charset='utf-8'>
		<title>Informations</title>
		<link rel='stylesheet' href='./Bootstrap/css/bootstrap.css'>
		<link rel='stylesheet' href='./view/style/all.css'>
		<script src='./Bootstrap/js/bootstrap.min.js'></script>
	</head>
	<body class="calendar_back">
		<div class = "container">
			<h1 class = "display-4 text-center my-3 card cardbox">  Informations de <?php echo utf8_encode($_SESSION['profil']['genre'].".".$_SESSION['profil']['nom']) ?> </h1>
			<form action="./index.php?controle=dashboard&action=load" method="get">
				<button type="submit" class="cardbox mb-3 btn btn-dark">Retour au dashboard</button>
			</form>
			<div class=" cardbox card bg-light mb-3">
				<div class=" h3 card-header">
					Image de l'utilisateur
				</div>
				<div class="card-text">
					<img src= "<?php echo utf8_encode($_SESSION['profil']['urlPhoto'])?>" style="width:200px;height:200px;" alt="L'utilisateur n'a pas défini de photo" class="m-1 img-thumbnail float-left ">
					<div class ="float-left m-2">
						<form action="index.php?controle=usr&action=uploadFile" method="post" enctype="multipart/form-data">
							<p class="mt-1">
								Vous avez la possibilité de changer votre image d'utilisateur. Vous pouvez ajouter puis envoyer votre image ci dessous :
							</p>
							<input type="file" class="form-control-file" name="fileToUpload" id="fileToUpload"><br>
							<button class=" btn btn-success" type="submit" name="submit">Envoyer</button>
							<?php echo utf8_encode($msg) ?>
						</form>
					</div>
				</div>
			</div>
		</div>
		<body>