<nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light shadow">
  <a class="navbar-brand" href="./index.php?controle=etudiant&action=load"><img src="./bootstrap/svg/calendar.svg" height="30" alt="calendar"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
  <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="./index.php?controle=etudiant&action=load&subaction=EDTH">EDTH</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="./index.php?controle=etudiant&action=load&subaction=ListProf">Liste professeurs</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="./index.php?controle=etudiant&action=load&subaction=ParamUtil">Paramètres utilisateur</a>
      </li>
    </ul>
    <form class="form-inline">
      <img class="mr-2 rounded-circle shadow-sm" style="object-fit: cover"src=<?= $_SESSION['profile']["urlPhoto"]== ''? ($_SESSION['profile']["genre"]=="M" ?"./resources/default_avatars/male.png": "./resources/default_avatars/female.png"): $_SESSION['profile']["urlPhoto"] ;?> width="40" height="40" alt="avatar">
      <label class="h5 mr-3 text-capitalize"> <?= $_SESSION['type'].": ".$_SESSION['profile']['genre'].". ".$_SESSION['profile']['prenom']." ".$_SESSION['profile']['nom']?></label>
      <input type="hidden" class="form-control" name="controle" value="connection">
      <button type="submit" class="btn btn-danger shadow-sm my-2 my-sm-0" name="action" value="disconnect">Déconnexion</button>
    </form>
  </div>
</nav>