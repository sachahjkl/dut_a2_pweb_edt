<body class='calendar_back'>
	<?php require './view/prof_resp/navbar.tpl';?>
	<div class="container-fluid mt-6">
		<div class="container">
			<div class="card shadow">
				<h5 class="card-header ">Modifier le label : </h5>
				<div class="card-body">
					<form class="form-check" action ="./index.php" method="get">
						<input type="hidden" name="controle" value="prof_resp">
						<input type="hidden" name="action" value="load">
						<div class="input-group">
							<div class="input-group-prepend">
								<label class="input-group-text form-control" for="inputGroupSelect01">Entrez le nouveau label</label>
							</div>
							<input class="input-group-text form-control"   name="label" type="text" value= "">
							<div class="input-group-append">
								<button type="submit" class="btn btn-secondary btn "name="subaction" value="label">Valider</button>
							</div>
						</div>
					</form>
					
			
				</div>
			</div>
		</div>
	</div>
</body>