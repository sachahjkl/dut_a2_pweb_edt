<!DOCTYPE html>
<html>
	<head>
		<title>Connexion d'un <?php echo $util?></title>
		<meta charset='utf-8'>
		<link rel="stylesheet" href="./Bootstrap/css/bootstrap.min.css">
		<script src="./Bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="./view/style/all.css">
	</head>
	<body class="calendar_back">
		<div class="container">
			<div class="row">
				<div class="col-2"></div>
				<div class="card shadow-dark mt-5 col-8">
					<div class="card-body">
						<h1 class="display-4 text-center">Connexion d'un <?php echo $util?></h1>
					</div>
				</div>
			</div>
			<div class="jumbotron shadow-dark mt-5">
				<h3 class=" res">Remplissez ces champs :</h1>
				<hr class="m-y-md">
				<form action=<?php echo utf8_encode("./index.php?controle=".$type."&action=connect"); ?> method="post" accept-charset="utf-8">
					<div class="form-group">
						<label for="login">Login</label>
						<input type="text" class="form-control" name="login" id="login" aria-describedby="loginHelp" placeholder="Saisissez votre login" value="<?= $login?>">
						<small id="loginHelp" class="form-text text-muted">Ce login ne doit jamais être partagé.</small>
					</div>
					<div class="form-group">
						<label for="password">Mot de passe</label>
						<input type="password" name="pwd" class="form-control" id="pwd" placeholder="Saisissez votre mot de passe">
					</div>
					<button type="submit" class="btn btn-success">Connexion</button>
					<button type="button" onclick="window.location.href='./index.php'"  class="btn btn">Retour</button>
				</form>
				<div class="row">
					<?=$msg?>
				</div>
				
			</div>
			
		</div>
	</body>
</html>