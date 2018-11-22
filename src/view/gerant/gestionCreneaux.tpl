<body class='calendar_back'>
	<?php require './view/professeur/navbar.tpl';?>
	<div class="container-fluid mt-6">
		<div class="container">
			<div class="card shadow">
				<h5 class="card-header ">Gestion des creneaux et matières :</h5>
				<div class="card-body">
					<p class="card-text">Cliquez sur le "+" pour étendre l'affichage</p>
					<?php foreach ($mats as $r): ?>
					<div class="card shadow-sm mt-3 " style = "border-color: <?=$r['couleur'] ?>; border-width: 2px">
						<form class="card-header" action="./index.php" method="get" accept-charset="utf-8">
							<input type="hidden" name="controle" value="gerant">
							<input type="hidden" name="action" value="load">
							<input type="hidden" name="id_mat" value="<?= $r['id_mat']?>">
							<h5 class="m-0">
							<a class="text-dark" data-toggle="collapse" href=<?='#'.str_replace(' ','_',$r['label'])?> role="button" aria-expanded="false" aria-controls=
							<?=str_replace(' ','_',$r['label'])?>><img class="align-items-center mr-2" src="./bootstrap/svg/plus.svg" height="15" alt="plus"></a>
							<input class="form-control-sm h5 m-0" type="text" name="newLabel" value="<?=$r['label']?>" size="12" placeholder="Label matière">
							<?=" - ".$r['nom']?>
							<button type="submit" class="btn btn-sm btn-success " name="subaction" value="MajLabel">Mettre à jour le label</button>
							</h5>
						</form>
						<div class="collapse" id=<?=str_replace(' ','_',$r['label'])?>>
							<div class="card-body">
								<p class="card-text">Cliquez sur "+" pour étendre l'affichage:</p>
								<?php foreach ($r['creneaux'] as $c): ?>
								<div class="card shadow-sm mt-2">
									<h5 class="card-header align-items-center">
									<a class="text-dark" data-toggle="collapse" href=<?='#'.str_replace(' ','_',$r['label'].$c["id_creneau"])?> role="button" aria-expanded="false" aria-controls=
									<?=str_replace(' ','_',$r['label'].$c["id_creneau"])?>>
									<img class="align-items-center mr-2" src="./bootstrap/svg/plus.svg" height="15" alt="plus"></a>Créneau n°<?=$c['id_creneau']?>
									</h5>
									<div class="collapse " id=<?=str_replace(' ','_',$r['label'].$c["id_creneau"])?>>
										<div class="card-body">
											<form action="./index.php" method="get" accept-charset="utf-8">
												<select name="selectedSalle" class="custom-select-sm rounded-right">
													<?php foreach ($salles as $s): ?>
													<?php if ($s["id_salle"] == $c["id_salle"]): ?>
													<option selected value= <?=$s["id_salle"] ?>><?= $s["nom"]." - ".$s["type_salle"]." - ".$s["nb_postes"]?></option>
													<?php else: ?>
													<option value= <?=$s["id_salle"] ?>><?= $s["nom"]." - ".$s["type_salle"]." - ".$s["nb_postes"]?></option>
													<?php endif ?>
													<?php endforeach ?>
												</select>
											</form>
										</div>
									</div>
								</div>
								<?php endforeach ?>
								<div class="card card-body mt-2">
									<h5>Ajout d'un creneau : </h5>
									<label>Choix de la salle:
										<select name="selectedSalle" class="custom-select-sm rounded ml-1">
											<?php foreach ($salles as $s): ?>
											<option value= <?=$s["id_salle"] ?>><?= $s["nom"]." - ".$s["type_salle"]." - ".$s["nb_postes"]?></option>
											<?php endforeach ?>
										</select>
									</label>
								</div>
							</div>
						</div>
					</div>
					<?php endforeach ?>
				</div>
			</div>
		</div>
	</div>
</body>
<!-- <?=$c["id_creneau"].$r['label']?> -->