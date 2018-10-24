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
		<div class="container-fluid my-3" style="min-width: 1000px; min-height: 800px; ">
			<div class="container-fluid">
				<div class="row">
					<div class="container-fluid card shadow-dark" style="height: 3em">
						infos_usr
					</div>
				</div>
				<div class="row">
					<div class="container col-10" >
						<div class="row my-1">
							<div class="container-fluid ">
								<div class="row mt-1">
									<div class="card container-fluid shadow-dark mr-2" style="min-height: 500px; height: 60vh">
									<?php require("./view/dashboard/EDTH.tpl")?>
									</div>
								</div>
								<div class="row mt-2">
									<div class="card container-fluid shadow-dark mr-2">
										<div class="card-body">
											<?php require"./view/dashboard/menuEDTH.tpl"?>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row mt-2">
							<div role="chat" class="container col card shadow-dark mr-2">
								<div class="card-body">
									<h4>chat</h4>
								</div>
							</div>
							<div role="contraintes" class="container col card shadow-dark mr-2">
								<div class="card-body">
									<h4>contraintes</h4>
								</div>
							</div>
						</div>
					</div>
					<div role="menuUsr" class="container col-2 card shadow-dark mt-2" >
						<?php require("./view/dashboard/".$menuFile)?>
					</div>
				</div>
			</div>
			
		</div>
	</body>