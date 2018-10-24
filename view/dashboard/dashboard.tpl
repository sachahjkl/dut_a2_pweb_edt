<!DOCTYPE html>
<html>
	<head>
		<title> Choix de l'utilisateur</title>
		<meta charset='utf-8'>
		<link rel='stylesheet' href='./bootstrap/css/bootstrap.css'>
		<link rel='stylesheet' href='./view/style/all.css'>
		<script src='./Bootstrap/js/bootstrap.min.js'></script>
	</head>
	<body class="calendar_back">
		<div class="container-fluid" style="height: 100vh; min-width: 1000px; min-height: 800px">
			<div class="row">
				<div class="container-fluid card shadow-dark" style="height: 3em">
					infos_usr
				</div>
			</div>
			<div class="row">
				<div class="container col-10" >
					<div class="row">
						<div role="creneaux" class="container-fluid card shadow-dark ">
							<div class="row ">
								<div role="heures" class="container col-2" style="float: left;">
									heures
								</div>
								<div role="heures" class="container col-2" style="float: left;">
									heures
								</div>
								<div role="heures" class="container col-2" style="float: left;">
									heures
								</div>
								<div role="heures" class="container col-2" style="float: left;">
									heures
								</div>
								<div role="heures" class="container col-2" style="float: left;">
									heures
								</div>
								<div role="heures" class="container col-2" style="float: left;">
									heures
								</div>
							</div>
						</div>
						<div role="menu_edth" class="container-fluid card shadow-dark">
							<?= require"./index/view/dashboard/menuEDTH.tpl"?>
						</div>
					</div>
					<div class="row">
						<div role="chat" class="container col-6 card shadow-dark">
							chat
						</div>
						<div role="contraintes" class="container col-6 card shadow-dark">
							contraintes
						</div>
					</div>
				</div>
				<div role="menuUsr" class="container col-2 card shadow-dark" >
					<?= require("./view/dashboard/".$menuFile)?>
				</div>
			</div>
		</div>
	</body>