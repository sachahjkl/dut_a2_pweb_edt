<!DOCTYPE html>
<html>
	<head>
		<title>Erreur 404</title>
		<meta charset='utf-8'>
		<link rel='stylesheet' href='./bootstrap/css/bootstrap.min.css'>
		<link rel='stylesheet' href='./view/style/all.css'>
		<script src='./Bootstrap/js/bootstrap.min.js'></script>
		<style type='text/css'>
		body {
		background: #dedede;
		}
		.page-wrap {
		min-height: 100vh;
		}
		</style>
	</head>
	<body>
		<div class='page-wrap d-flex flex-row align-items-center'>
			<div class='container'>
				<div class='row justify-content-center'>
					<div class='col-md-12 text-center'>
						<span class='display-1 d-block'>404</span>
						<div class='mb-4 lead'>La page demandée n'a pas été trouvée.</div>
						<div class='alert alert-danger mt-3 text-center text-dark d-inline-flex' role='alert'> <?= $errorMessage ?> </div><br>
						<a href='./index.php' class='btn btn-link'>Retour à l'accueil</a>
					</div>
				</div>
			</div>
		</div>
	</body></html>