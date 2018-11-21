<body class='calendar_back'>
	<?php require './view/professeur/navbar.tpl';?>
	<div class="container-fluid mt-6">
		<div class="container">
			<div class="card shadow">
				<h5 class="card-header ">Gestion des creneaux et matières :</h5>
				<div class="card-body">
					<?php foreach ($roles as $r): ?>
					<div class="card shadow-sm mt-3 " style = "border-color: <?=$r['couleur'] ?>; border-width: 2px">
							<form class="card-header" action="./index.php" method="get" accept-charset="utf-8">
							<input type="hidden" name="controle" value="professeur_resp">
							<input type="hidden" name="action" value="load">
							<input type="hidden" name="id_mat" value="<?= $r['id_mat']?>">
							<h5 class="m-0"><input class="form-control-sm h5 m-0" type="text" name="newLabel" value="<?=$r['label']?>" size="12" placeholder="Label matière">
							<?=" - ".$r['nom']?>
							<button type="submit" class="btn btn-sm btn-success " name="subaction" value="MajLabel">Mettre à jour le label</button></h5>
						</form>
						<div class="card-body">
							<p class="card-text">Cliquez sur "Créneau n°x" pour l'étendre :</p>
							<?php foreach ($r['creneaux'] as $c): ?>
							<div class="card shadow-sm mt-2">
								<h5 class="card-header">
								<a class="text-dark" data-toggle="collapse" href=<?='#'.str_replace(' ','_',$r['label'].$c["id_creneau"])?> role="button" aria-expanded="false" aria-controls=
									<?=str_replace(' ','_',$r['label'].$c["id_creneau"])?>>Créneau n°<?=$c['id_creneau']?>
								</a>
								</h5>
								<div class="collapse " id=<?=str_replace(' ','_',$r['label'].$c["id_creneau"])?>>
									<div class="card-body">A finir</div>
								</div>
							</div>
							<?php endforeach ?>
						</div>
					</div>
					<?php endforeach ?>
				</div>
			</div>
		</div>
	</div>
</body>
<!-- <?=$c["id_creneau"].$r['label']?> -->