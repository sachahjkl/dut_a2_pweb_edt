<!doctype html>
<html lang="fr">
<head>
	<meta charset="utf-8">
	<title>Connexion d'un professeur</title>
	<link rel="stylesheet" href="./Bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="./Vue/style/all.css">
	<script src="./Bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="calendar_back">
	<div class="container jumbotron vertical-center cardbox" style="margin-top: 25vh;">
		<h1 class="text-center display-4 ">Connexion d'un professeur</h1>
		<form class="align-items-center"method="post">
			<div class = row>
				<div class="col-sm-2"></div>
				<div class="form-group col-sm-8 ">
					<label class="h5" for="login">Login:</label>
				<input class="form-control" type="text" name="login" id="login" value="<?php echo $login; ?>">
			</div>
			</div>
			
			<br>
			<div class = row>
				<div class="col-sm-2"></div>
				<div class="form-group col-sm-8">
					<label class="h5" for="pwd" >Mot de passe:</label>
					<input class="form-control" type="password" name="pwd" id="pwd" value="<?php echo $pwd; ?>">
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-sm-2"></div>
				<div class="col-sm-8 text-center"id ="m"> <?php echo $msg; ?> </div>
			</div>
			<br>
			<div class="row">
				<div class="col-sm-3"></div>
				<div class= "btn-group col-sm-6">
					<button  type="submit" class="btn btn-primary col-sm" name="action" value="connect_prof">Connexion</button>
					<button  type="submit" class="btn btn-secondary col-sm" name="action" value="choix">Retour</button>
					<input type="hidden" name="controle" value="choix_type_util">
				</div>
			</div>
		</form>
	</div>
	
</body>