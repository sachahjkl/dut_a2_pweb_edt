<body class='calendar_back'>
	<?php require './view/professeur/navbar.tpl';?>
	<div class="container-fluid mt-6">
		<div class="container">
			<div class="card shadow">
				<h5 class="card-header ">Recherche d'étudiant : </h5>
				<div class="card-body">
					<form class="form-check" action ="./index.php" method="get">
						<input type="hidden" name="controle" value="professeur">
						<input type="hidden" name="action" value="load">
						<input type="hidden" name="subaction" value="Etudiant">
						<div class="input-group">
							<div class="input-group-prepend">
								<label class="input-group-text form-control" for="inputGroupSelect01">Choix du groupe</label>
							</div>
							<select onchange="this.form.submit()" name="selectedGrp" class="custom-select" id="inputGroupSelect01">
								<?php foreach ($grps as $g): ?>
								<?php if ($g['id_grpe'] == $_GET['selectedGrp']): ?>
								<option selected value= <?=$g["id_grpe"] ?>><?= $g["num_grpe"]?></option>
								<?php else: ?>
								<option value= <?=$g["id_grpe"] ?>><?= $g["num_grpe"]?></option>
								<?php endif ?>
								<?php endforeach ?>
							</select>
						</div>
					</form>
					
					<table class=" mt-3 table table-striped">
						<thead class="thead-dark">
							<tr>
								<th scope="col" class="text-capitalize">Eleve :</th>
								<th scope="col" class="text-capitalize">Groupe :</th>
								<th scope="col" class="text-capitalize">Mail :</th>
							</tr>
						</thead>
						<tbody>
							<?php foreach ($etusGrp as $etu): ?>
							<tr>
								<th scope="row" class="text-capitalize"><?=$etu['genre'].". ".$etu['prenom']." ".$etu['nom']?></th>
								<td class="text-capitalize"><?= $etu['num_grpe']?></td>
								<td class="text-capitalize"><?= $etu['email']?></td>
							</tr>
							<?php endforeach ?>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>