<form action="./index.php?controle=etudiant&action=loadDashboard"method="get">
	<div class="row my-2">
		<div class="col-2">
			<label for="matiere">EDTH</label>
			<select id="idEDTH" name="idEDTH"class="form-control">
				<?php foreach ($EDTH as $v): ?>
				<?php if ($_GET["idEDTH"]==$v["id_edth"]): ?>
				<option selected value= <?=$v["id_edth"] ?>> <?= $v["label"]?></option>
				<?php else: ?>
				<option value= <?=$v["id_edth"] ?>> <?= $v["label"]?></option>
				<?php endif ?>
				<?php endforeach ?>
			</select>
		</div>
		<div class="col-2">
			<label for="matiere">Matière</label>
			<select id="matiere" name="idMat"class="form-control">
				<?php if ($matiere=="all"): ?>
				<option selected value="all">Toutes</option>
				<?php else: ?>
				<option value="all">Toutes</option>
				<?php endif ?>
				<?php foreach ($matieres as $v): ?>
				<?php if ($_GET["matiere"] == $v["label"]): ?>
				<option selected value= <?=$v["id_mat"] ?>> <?= $v["label"]?></option>
				<?php else: ?>
				<option value= <?=$v["id_mat"] ?>> <?= $v["label"]?></option>
				<?php endif ?>
				<?php endforeach ?>
			</select>
		</div>
		<div class="col-2">
			<label for="prof">Prof</label>
			<select id="prof" name="idProf" class="form-control">
				<?php if ($matiere=="all"): ?>
				<option selected value="all">Toutes</option>
				<?php else: ?>
				<option value="all">Toutes</option>
				<?php endif ?>
				<?php foreach ($profs as $v): ?>
				<?php if ($_GET["prof"] == $v["label"]): ?>
				<option selected value= <?=$v["id_prof"] ?>> <?= $v["label"]?></option>
				<?php else: ?>
				<option value= <?=$v["id_prof"] ?>> <?= $v["label"]?></option>
				<?php endif ?>
				
				<?php endforeach ?>
			</select>
		</div>
		<div class="col-2">
			<label for="grpe">Groupe</label>
			<select id="grpe" name="idgrp"class="form-control">
				<?php if ($matiere=="all"): ?>
				<option selected value="all">Toutes</option>
				<?php else: ?>
				<option value="all">Toutes</option>
				<?php endif ?>
				<?php foreach ($grps as $v): ?>
				<?php if ($_GET["grpe"] == $v["num_grpe"]): ?>
				<option selected value= <?=$v["id_grpe"] ?>> <?= $v["num_grpe"]?></option>
				<?php else: ?>
				<option value= <?=$v["id_grpe"] ?>> <?= $v["num_grpe"]?></option>
				<?php endif ?>
				
				<?php endforeach ?>
			</select>
		</div>
	</div>
</form>