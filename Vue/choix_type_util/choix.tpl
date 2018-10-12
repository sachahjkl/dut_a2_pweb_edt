<!doctype html>
<html lang="fr">
<head>
	<meta charset="utf-8">
	<title>Choix du type d'utilisateur</title>
	<link rel="stylesheet" href="./Bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="./Vue/style/all.css">
	<script src="./Bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="calendar_back">
	<div class="container jumbotron vertical-center cardbox" style="margin-top: 30vh;">
		<h1 class="text-center display-4 ">Veuillez choisir votre type d'utilisateur:</h1>
		<br>
		<form class="row align-items-center" action="index.php" method="get">
			<div class="col-sm"></div>
			<div class= "btn-group col-sm-6 col-sm-offset-6">
				<button  type="submit" class="btn btn-primary col-sm" name="action" value="connect_etu">Etudiant</button>
				<input type="hidden" name="controle" value="choix_type_util">
				<button  type="submit" class="btn btn-secondary col-sm" name="action" value="connect_prof">Professeur</button>
			</div>
			<div class="col-sm"></div>
		</form>
	</div>
</body>