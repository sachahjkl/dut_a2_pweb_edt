<body class="calendar_back align-middle">
	<div class="container">
		<div class="row">
			<div class="col-2"></div>
			<div class="card shadow-lg mt-5 col-8">
				<div class="card-body">
					<h1 class="display-4 text-center text-gray-dark">Gestionnaire d'EDT</h1>
				</div>
			</div>
		</div>
		<div class="jumbotron shadow-lg mt-5">
			<h3 c>Connectez vous en tant que professeur ou étudiant :</h3>
			<hr class="m-y-md">
			<form action="./index.php?controle=connection&action=login" method="post" accept-charset="utf-8">
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
			</form>
			<div class="row">
				<?=$msg?>
			</div>
		</div>
	</div>
</body>