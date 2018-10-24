<form action="./index.php"method="get" >
	<div class="row">
		<div class="col">
			<label class="small" for="matiere">EDTH</label>
			<select id="idEDTH" name="idEDTH"class="form-control-sm">
				<?php foreach ($EDTH as $v): ?>
				<?php if ($_GET["idEDTH"]==$v["id_edth"]): ?>
				<option selected value= <?=$v["id_edth"] ?>> <?= $v["label"]?></option>
				<?php else: ?>
				<option value= <?=$v["id_edth"] ?>> <?= $v["label"]?></option>
				<?php endif ?>
				<?php endforeach ?>
			</select>
		</div>
		<div class="col">
			<label class="small" for="matiere">Matière</label>
			<select id="matiere" name="idMat"class="form-control-sm">
				<?php if ($matiere =="all"): ?>
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
		<div class="col">
			<label class="small" for="prof">Prof</label>
			<select id="prof" name="idProf" class="form-control-sm">
				<?php if ($matiere=="all"): ?>
				<option selected value="all">Tous</option>
				<?php else: ?>
				<option value="all">Tous</option>
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
		<div class="col">
			<label class="small" for="grpe">Groupe</label>
			<select id="grpe" name="idgrp"class="form-control-sm">
				<?php foreach ($grps as $v): ?>
				<?php if ($_GET["grpe"] == $v["num_grpe"]): ?>
				<option selected value= <?=$v["id_grpe"] ?>> <?= $v["num_grpe"]?></option>
				<?php else: ?>
				<option value= <?=$v["id_grpe"] ?>> <?= $v["num_grpe"]?></option>
				<?php endif ?>
				<?php endforeach ?>
			</select>
		</div>
		<input type="hidden" name="controle" value= <?=$_SESSION["userType"] ?>>
		<input type="hidden" name="action" value="loadDashboard">
	</div>
</form>