<!DOCTYPE html>
<html>
	<head>
		<title> Choix de l'utilisateur</title>
		<meta charset='utf-8'>
		<link rel='stylesheet' href='./bootstrap/css/bootstrap.css'>
		<link rel='stylesheet' href='./view/style/all.css'>
		<script src='./Bootstrap/js/bootstrap.min.js'></script>
	</head>
	<body class="calendar_back">
		<div class="container page-wrap">
			<div class="row">
				<div class="col-2"></div>
				<div class="card shadow-dark mt-5 mb-3 col-8">
					<div class="card-body">
						<h1 class="display-4 text-center">Gestionnaire d'EDTH</h1>
					</div>
				</div>
			</div>
			
			<div class="jumbotron shadow-dark mt-5">
				<h1 class="display-3 text-center res">Choisissez votre type d'utilisateur :</h1>
				<hr class="m-y-md">
				<form class="mt-2" action="./index.php" method="get" accept-charset="utf-8">
					<div class="row">
						<div class ="col-2"></div>
						<div class="btn-group col-8 " role="group" aria-label="user_select">
							<button type="submit" name="controle" value="etudiant" class="btn btn-primary btn-lg col">Etudiant</button>
							<input type="hidden" name="action" value="login">
							<button type="submit" name="controle" value="professeur" class="btn btn-lg btn-success col">Professeur</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		
	</body>
</html>