<body class='calendar_back'>
	<?php require './view/professeur/navbar.tpl';?>
	<div class="container-fluid mt-6">
		<div class="container">
			<div class="card shadow">
				<h5 class="card-header ">Infos de : <small class="text-muted"> <?=$_SESSION['type'] . ": " . $_SESSION['profile']['genre'] . ". " . $_SESSION['profile']['prenom'] . " " . $_SESSION['profile']['nom'];?></small></h5>
				<div class="card-body">
					<dl class="row">
						<dt class="col-sm-3">Type d'utilisateur :</dt>
						<dd class="col-sm-9 text-capitalize"><?=$_SESSION['type'];?></dd>
						<dt class="col-sm-3">Genre :</dt>
						<dd class="col-sm-9"><?=$_SESSION['profile']['genre'];?></dd>
						<dt class="col-sm-3">Nom :</dt>
						<dd class="col-sm-9 text-capitalize"><?=$_SESSION['profile']['nom'];?></dd>
						<dt class="col-sm-3">Prénom :</dt>
						<dd class="col-sm-9 text-capitalize"><?=$_SESSION['profile']['prenom'];?></dd>
						<dt class="col-sm-3">Login :</dt>
						<dd class="col-sm-9"><?=$_SESSION['profile']['login_prof'];?></dd>
						<dt class="col-sm-3">Date d'inscription :</dt>
						<dd class="col-sm-9"><?=$_SESSION['profile']['date_prof'];?></dd>
						<dt class="col-sm-3">Image :</dt>
						<dd class="col-sm-9"><img class="mt-1 rounded shadow" style="object-fit: cover;" src=<?=$_SESSION['profile']["urlPhoto"] == '' ? ($_SESSION['profile']["genre"] == "M" ? "./resources/default_avatars/male.png" : "./resources/default_avatars/female.png") : $_SESSION['profile']["urlPhoto"];?> width="100" height="100" alt="avatar"></dd>
					</dl>
					<div class="card-deck">
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">Mise à jour de l'image de profil :</h5>
								<p class="card-text">Veuillez choisir spécifier votre image de profil</p>
								<form action="./index.php?controle=professeur&action=load&subaction=NewPicture" method="post" enctype="multipart/form-data">
									<div class="input-group">
										<div class="custom-file">
											<input type="file" class="form-control-file" name="newPP" id="newPP" aria-describedby="IGFA4">
											<label class="custom-file-label" for="newPP">Choisir le fichier</label>
										</div>
										<div class="input-group-append">
											<button class="btn btn-outline-success" name="submit" type="submit" id="IGFA4">Envoyer</button>
										</div>
									</div>
								</form>
								<div class="">
									<?=$msgUpload;?>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">Changement de mot de passe :</h5>
								<form action="./index.php?controle=professeur&action=load&subaction=NewPassword" method="post" enctype="multipart/form-data">
									<div class="input-group-sm mb-1">
										<div class="input-group-prepend">
											<span class="input-group-text">Votre mot de passe actuel</span>
										</div>
										<input type="password" class="form-control" name="pwdNow">
									</div>
									<div class="input-group-sm mb-1">
										<div class="input-group-prepend">
											<span class="input-group-text">Votre nouveau mot de passe</span>
										</div>
										<input type="password" class="form-control" name="pwdNew1">
									</div>
									<div class="input-group-sm mb-1">
										<div class="input-group-prepend">
											<span class="input-group-text">Répétez votre nouveau mot de passe</span>
										</div>
										<input type="password" class="form-control" name="pwdNew2">
									</div>
									<button class="btn btn-outline-success" name="submit" type="submit">Envoyer</button>
								</form>
								<div class="">
									<?=$msgPwd;?>
								</div>
							</div>
						</div>
					</div>
					<div class="card mt-4">
						<div class="card-body">
							<h5 class="card-title">Choix de votre couleur :</h5>
							<div class="row card-text">
								<?php if ($_SESSION['profile']['couleur'] != ''): ?>
								<p class=" ml-3 card-text font-weight-bold">couleur actuelle : </p>
								<div class="ml-2 rounded-circle shadow-sm" style ="background-color: <?=isset($_SESSION['profile']['couleur']) ? $_SESSION['profile']['couleur'] : '#f8f9fa';?>!important; width: 2em; height: 2em"></div>
								<?php endif;?>
							</div>
							<p class="card-text">Vous pouvez choisir votre couleur parmis celles disponibles ici en cliquant sur celle que vous désirez.</p>
							<div class="container d-flex flex-wrap">
								<?php
								$json       = file_get_contents("./resources/colors.json");
								$colorsJson = json_decode($json, true);
								foreach ($colorsJson as $colors): ?>
								<?php foreach ($colors as $c): ?>
								<?php $authorized = true;?>
								<?php foreach ($colorsTaken as $ct):
								if ($ct['couleur'] == $c) {
								$authorized = false;
								}
								endforeach;?>
								<?php if ($authorized): ?>
								<a href="./index.php?controle=professeur&action=load&subaction=UpdateColor&newColor=<?=explode("#", $c)[1];?>">
									<div class="m-1 rounded-circle shadow-sm " style="background-color: <?=$c;?>; height:40px; width: 40px;"></div>
								</a>
								<?php endif;?>
								<?php endforeach;?>
								<?php endforeach;?>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>