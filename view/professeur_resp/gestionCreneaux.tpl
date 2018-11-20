<body class='calendar_back'>
	<?php require './view/professeur/navbar.tpl';?>
	<div class="container-fluid mt-6">
		<div class="container">
			<div class="card shadow">
				<h5 class="card-header ">Gestion des creneaux et matières :</h5>
				<div class="card-body">
					<?= var_dump($_SESSION['profile']['roles'], $_SESSION['profile']['gerant'])?>
				</div>
			</div>
		</div>
	</div>
</body>