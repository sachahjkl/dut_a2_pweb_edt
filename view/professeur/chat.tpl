<body class='calendar_back'>
	<script type="text/javascript" charset="utf-8" >
		window.onload=function (){
			var div = document.getElementById('chat');
			$('#' + 'chat').animate({
      scrollTop: div.scrollHeight - div.clientHeight
   }, 500);
		}
	</script>
	<?php require './view/professeur/navbar.tpl';?>
	<div class="container-fluid mt-6">
		<div class="container">
			<div class="card shadow">
				<h5 class="card-header ">Chat : </h5>
				<div class="card-body">
					<p class="card-text"> Vous pouvez envoyer des messages à d'autres professeurs. Le nom de ceux connectés est affiché en <strong class="text-primary">bleu</strong>.</p>
					<form class="px-3" action ="./index.php" method="get">
						<input type="hidden" name="controle" value="professeur">
						<input type="hidden" name="action" value="load">
						<input type="hidden" name="subaction" value="Chat">
						<div class="input-group">
							<div class="input-group-prepend">
								<label class="input-group-text form-control" for="inputGroupSelect01">Choix du destinataire</label>
							</div>
							<select onchange="this.form.submit()" name="selectedProf" class="custom-select" id="inputGroupSelect01">
								<?php foreach ($profs as $p): ?>
								<?php if ($p['id_prof'] == $_GET['selectedProf']): ?>
								<option <?= $p['bConnect']? "class='text-primary'":''; ?> selected value= <?=$p["id_prof"] ?>> <?=$p['genre'].". ".$p['prenom']." ".$p['nom']?> </option>
								<?php else: ?>
								<option <?= $p['bConnect']? "class='text-primary'":''; ?> value= <?=$p["id_prof"] ?>> <?=$p['genre'].". ".$p['prenom']." ".$p['nom']?></option>
								<?php endif ?>
								<?php endforeach ?>
							</select>
						</div>
					</form>
					<div class="container my-3">
						<div id="chat" class="border shadow rounded" style="height: 400px; overflow-y: scroll">
							<?php foreach ($messages as $m): ?>
							<?php if ($m['id_src']== $profDest['id_prof']): ?>
							<div class="row" style="width: 99%">
								<div class="col ml-5 m-1 mt-3 rounded border shadow-sm" style="min-height: 70px;
								background-color: <?= $profDest['couleur']!='' ? $profDest['couleur']  : $DEFAULT_COLOR ;?>">
									<p class="m-2"><?= $m['contenu']?></p>
								</div>
								<div class="col-7"></div>
							</div>
							<?php else: ?>
							<div class="row" style="width: 99%">
								<div class="col-7"></div>
								<div class="col m-1 mt-3  rounded border shadow-sm" style="min-height: 70px;
								background-color: <?= $_SESSION['profile']['couleur']!='' ? $_SESSION['profile']['couleur']  : $DEFAULT_COLOR ;?>">
									<p class="m-2"><?= $m['contenu']?></p>
								</div>
							</div>
							<?php endif ?>
							<?php endforeach ?>
						</div>
						<form class="px-3" action="./index.php" method="get" accept-charset="utf-8">
							<input type="hidden" name="controle" value="professeur">
							<input type="hidden" name="action" value="load">
							<input type="hidden" name="selectedProf" value=<?= $_GET['selectedProf']?>>
							<div class="mt-3 row">
								<textarea class="col shadow rounded border mr-2"  name="message"  placeholder="Saisissez votre message ici" style="height: 100px; resize: none"><?= $msg  ?></textarea>
								<button class=" col-2 shadow btn btn-primary" type="sumbit" name='subaction' value='SendMessage'>Envoyer</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>