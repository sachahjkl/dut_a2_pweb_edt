<body class='calendar_back'>
	<?php require './view/etudiant/navbar.tpl' ?>
	<div class="container-fluid mt-6">
		<div class="mx-3">
			<div class="row" >
				<div>
					<div class=" mx-1 px-2 mb-1 shadow card bg-faded"  style="height: 50px;"></div>
					<div class="card bg-dark text-white shadow small mx-1 px-2" style="min-height: 500px;">
						<?php
							for ($i = 0; $i < 22 ; $i++) {
								echo "<div class='text-right mt-1' style='height:26px;'>".date('H\hi -',(28800 + $i*1800))."</div>";
							}
						?>
					</div>
				</div>
				<div class="col">
					<div class="row">
						<?php
						for ($i = 0; $i < 5 ; $i++) {
						echo "<div class='col mx-1 mb-1 card bg-danger text-white h5 text-center shadow text-capitalize' role='alert' style='height: 50px;'><span class='my-auto'>".strftime('%A %d/%m',(int)($edthSelected["tDeb"]+(86400*$i)))."</span></div>";
						}
						?>
					</div>
					<div class="row" style="position: relative;">
						<div class="card col bg-light mx-1 shadow" style="min-height: 662px;">
							<?php
								for ($i = 0; $i < 22 ; $i++)
									echo ("<hr class='my-0' style='width: 90%;margin: 0% 5%; position: absolute; top: ". (14 + $i * 30 )."px; left:0px;right:0px;'/>");
							?>
							<?php foreach ($lundi as $v):
								$couleur = $v['couleur'] == ""? "#c7c7c7" :$v['couleur'];
								$h = ($v["tFin"] - $v["tDeb"])/60 - 3;
								$top = 16 + (int)strftime("%H",$v["tDeb"])*60 + (int)strftime("%M",$v["tDeb"]) - 480;
							?>
								<div class="card d-flestrftime("%k" texH-center " style="background-color: <?=$couleur?>;heistrftime <%M=$h?>px;top: <?= $top?>px;left: 0; position: absolute; width: 90%; margin: 0 5%">
									<div class="card-body align-items-center d-flex justify-content-center"><h5 class="card-title creneau mb-0"><?= $v['pLabel']?> - <?=$v['mLabel']?> <?=$v['sType']?> <?=$v['sLabel']?> <?=$v['num_grpe']?></h5></div>
								</div>
							<?php endforeach ?>
						</div>
						<div class="card col bg-light mx-1 shadow" style="min-height: 662px;">
							<?php
								for ($i = 0; $i < 22 ; $i++)
									echo ("<hr class='my-0' style='width: 90%;margin: 0% 5%; position: absolute; top: ". (14 + $i * 30 )."px; left:0px;right:0px;'/>");
							?>
							<?php foreach ($mardi as $v):
								$couleur = $v['couleur'] == ""? "#c7c7c7" :$v['couleur'];
								$h = ($v["tFin"] - $v["tDeb"])/60 - 3;
								$top = 16 + (int)strftime("%H",$v["tDeb"])*60 + (int)strftime("%M",$v["tDeb"]) - 480;
							?>
								<div class="card d-flex shadow text-center " style="background-color: <?=$couleur?>;height: <?=$h?>px;top: <?= $top?>px;left: 0; position: absolute; width: 90%; margin: 0 5%">
									<div class="card-body align-items-center d-flex justify-content-center"><h5 class="card-title creneau mb-0"><?= $v['pLabel']?> - <?=$v['mLabel']?> <?=$v['sType']?> <?=$v['sLabel']?> <?=$v['num_grpe']?></h5></div>
								</div>
							<?php endforeach ?>
						</div>
						<div class="card col bg-light mx-1 shadow" style="min-height: 662px;">
							<?php
								for ($i = 0; $i < 22 ; $i++)
									echo ("<hr class='my-0' style='width: 90%;margin: 0% 5%; position: absolute; top: ". (14 + $i * 30 )."px; left:0px;right:0px;'/>");
							?>
							<?php foreach ($mercredi as $v):
								$couleur = $v['couleur'] == ""? "#c7c7c7" :$v['couleur'];
								$h = ($v["tFin"] - $v["tDeb"])/60 - 3;
								$top = 16 + (int)strftime("%H",$v["tDeb"])*60 + (int)strftime("%M",$v["tDeb"]) - 480;
							?>
								<div class="card d-flex shadow text-center " style="background-color: <?=$couleur?>;height: <?=$h?>px;top: <?= $top?>px;left: 0; position: absolute; width: 90%; margin: 0 5%">
									<div class="card-body align-items-center d-flex justify-content-center"><h5 class="card-title creneau mb-0"><?= $v['pLabel']?> - <?=$v['mLabel']?> <?=$v['sType']?> <?=$v['sLabel']?> <?=$v['num_grpe']?></h5></div>
								</div>
							<?php endforeach ?>
						</div>
						<div class="card col bg-light mx-1 shadow" style="min-height: 662px;">
							<?php
								for ($i = 0; $i < 22 ; $i++)
									echo ("<hr class='my-0' style='width: 90%;margin: 0% 5%; position: absolute; top: ". (14 + $i * 30 )."px; left:0px;right:0px;'/>");
							?>
							<?php foreach ($jeudi as $v):
								$couleur = $v['couleur'] == ""? "#c7c7c7" :$v['couleur'];
								$h = ($v["tFin"] - $v["tDeb"])/60 - 3;
								$top = 16 + (int)strftime("%H",$v["tDeb"])*60 + (int)strftime("%M",$v["tDeb"]) - 480;
							?>
								<div class="card d-flex shadow text-center " style="background-color: <?=$couleur?>;height: <?=$h?>px;top: <?= $top?>px;left: 0; position: absolute; width: 90%; margin: 0 5%">
									<div class="card-body align-items-center d-flex justify-content-center"><h5 class="card-title creneau mb-0"><?= $v['pLabel']?> - <?=$v['mLabel']?> <?=$v['sType']?> <?=$v['sLabel']?> <?=$v['num_grpe']?></h5></div>
								</div>
							<?php endforeach ?>
						</div>
						<div class="card col bg-light mx-1 shadow" style="min-height: 662px;">
							<?php
								for ($i = 0; $i < 22 ; $i++)
									echo ("<hr class='my-0' style='width: 90%;margin: 0% 5%; position: absolute; top: ". (14 + $i * 30 )."px; left:0px;right:0px;'/>");
							?>
							<?php foreach ($vendredi as $v):
								$couleur = $v['couleur'] == ""? "#c7c7c7" :$v['couleur'];
								$h = ($v["tFin"] - $v["tDeb"])/60 - 3;
								$top = 16 + (int)strftime("%H",$v["tDeb"])*60 + (int)strftime("%M",$v["tDeb"]) - 480;
							?>
								<div class="card d-flex shadow text-center " style="background-color: <?=$couleur?>;height: <?=$h?>px;top: <?= $top?>px;left: 0; position: absolute; width: 90%; margin: 0 5%">
									<div class="card-body align-items-center d-flex justify-content-center"><h5 class="card-title creneau mb-0"><?= $v['pLabel']?> - <?=$v['mLabel']?> <?=$v['sType']?> <?=$v['sLabel']?> <?=$v['num_grpe']?></h5></div>
								</div>
							<?php endforeach ?>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="mt-4 alert alert-light shadow" role="alert">
			<form class="form-check"action ="./index.php" method="get">
				<input type="hidden" name="controle" value="etudiant">
				<input type="hidden" name="action" value="load">
				<div class="input-group">
					<div class="input-group-prepend">
						<label class="input-group-text form-control-sm" for="inputGroupSelect01">EDTH N°</label>
					</div>
					<select onchange="this.form.submit()"name="selectedEDTH" class="custom-select-sm rounded-right" id="inputGroupSelect01">
						<?php foreach ($edth as $v): ?>
						<?php if ($v["id_edth"] == $_GET['selectedEDTH']): ?>
						<option selected value= <?=$v["id_edth"] ?>><?= $v["label"]?></option>
						<?php else: ?>
						<option value= <?=$v["id_edth"] ?>><?= $v["label"]?></option>
						<?php endif ?>
						<?php endforeach ?>
					</select>
				</form>
			</div>
		</div>
	</body>