<body class="calendar_back align-middle">
	<div class="container">
		<div class="row">
			<div class="col-2"></div>
			<div class="card shadow-lg mt-5 col-8">
				<div class="card-body">
					<div class="row">
						<h1 class="col display-4 text-center align-self-center">Gestionnaire d'EDT</h1>
					</div>
					
				</div>
			</div>
		</div>
		<div class="jumbotron shadow-lg mt-5">
			<h3>Connectez vous en tant que professeur ou étudiant :</h3>
			<hr class="m-y-md">
			<form action="./index.php?controle=connection&action=login" method="post" accept-charset="utf-8">
				<div class="form-group">
					<label for="login">Login</label>
					<input type="text" class="form-control" name="login" id="login" aria-describedby="loginHelp" placeholder="Saisissez votre login" value="<?= $login?>">
					<small id="loginHelp" class="form-text text-muted">Ce login ne doit jamais être partagé.</small>
				</div>
				<div class="form-group">
					<label for="pwd">Mot de passe</label>
					<input type="password" name="pwd" class="form-control" id="pwd" placeholder="Saisissez votre mot de passe">
				</div>
				<button type="submit" class="btn btn-success">Connexion</button>
			</form>
			<div class="row">
				<?=$msg?>
			</div>
		</div>
	</div>
	<img class="align-self-center mr-5"src="./resources/logo_descartes.png" height="50" width="50" alt="logo_descartes" style="position: absolute; bottom : 10px; left: 10px;">
</body>