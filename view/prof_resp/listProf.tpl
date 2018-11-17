<body class='calendar_back'>
	<?php require './view/prof_resp/navbar.tpl' ?>
	<div class="container-fluid mt-6">
		<div class="container">
			<div class="card shadow">
				<h5 class="card-header ">Professeurs intervenants et responsables par matière :</h5>
				<div class="card-body">
					<table class="table table-striped">
						<thead class="thead-dark">
							<tr>
								<th scope="col" class="text-capitalize">Professeur :</th>
								<th scope="col" class="text-capitalize">Rôle :</th>
								<th scope="col" class="text-capitalize">Mail :</th>
							</tr>
						</thead>
						<tbody>
							<?php foreach ($profRoles as $pr): ?>
							<tr <?= $pr['id_prof'] == $_SESSION['profile']['id_prof'] ?"class='table-success'":''?>>
								<th scope="row" class="text-capitalize"><?=$pr['genre'].". ".$pr['prenom']." ".$pr['nom'].
									($pr['id_prof'] == $_SESSION['profile']['id_prof'] ?' (Vous)':'') ?></th>
								<td class="text-capitalize"><?= $pr['label']?></td>
								<td class="text-capitalize"><?= $pr['email']?></td>
							</tr>
							<?php endforeach ?>
						</tbody>
					</table>
				</div>
			</div>
		</body>