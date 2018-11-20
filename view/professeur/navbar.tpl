<nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light shadow">
  <a class="navbar-brand" href="./index.php?controle=professeur&action=load"><img src="./bootstrap/svg/calendar.svg" height="30"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
  <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="nav navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="./index.php?controle=professeur&action=load&subaction=EDTH">EDTH</a>
      </li>
      <li class="mx-1 nav-item dropdown">
        <button class="btn btn-light nav-item nav-link dropdown-toggle" type="button" data-toggle="dropdown">Listes</button>
        <ul class="dropdown-menu">
          <li class="dropdown-item nav-item">
            <a class="nav-link" href="./index.php?controle=professeur&action=load&subaction=ListProf">Liste professeurs</a>
          </li>
          <li class=" dropdown-item nav-item">
            <a class="nav-link" href="./index.php?controle=professeur&action=load&subaction=Etudiant">Recherche d'étudiant</a>
          </li>
        </ul>
      </li>
      <li class="mx-1 nav-item dropdown">
        <button class="btn btn-light nav-item nav-link dropdown-toggle" type="button" data-toggle="dropdown">Gestion</button>
        <ul class="dropdown-menu">
          <li class="dropdown-item nav-item">
            <a class="nav-link" href="./index.php?controle=professeur&action=load&subaction=Chat">Chat</a>
          </li>
          <?php if (isset($_SESSION['profile']['roles'])): ?>
          <?php if ($_SESSION['profile']['gerant']): ?>
            <li class=" dropdown-item nav-item">
            <a class="nav-link" href="./index.php?controle=gerant&action=load&subaction=Creneaux">Creneaux</a>
          </li>
          <?php else:?>
            <li class=" dropdown-item nav-item">
            <a class="nav-link" href="./index.php?controle=professeur_resp&action=load&subaction=Creneaux">Creneaux</a>
          </li>
          <?php endif ?>
          <?php endif ?>
        </ul>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="./index.php?controle=professeur&action=load&subaction=ParamUtil">Paramètres utilisateur</a>
      </li>
    </ul>
    <form class="form-inline">
      <?php if ($_SESSION['profile']['couleur'] !=''): ?>
      <div class="mr-2 rounded-circle shadow-sm" style ="background-color: <?= isset($_SESSION['profile']['couleur']) ? $_SESSION['profile']['couleur']  : '#f8f9fa' ;?>!important; width: 40px; height: 40px"></div>
      <?php endif ?>
      <img class="mr-2 rounded-circle shadow-sm" style="object-fit: cover"src=<?= $_SESSION['profile']["urlPhoto"]== ''? ($_SESSION['profile']["genre"]=="M" ?"./resources/default_avatars/male.png": "./resources/default_avatars/female.png"): $_SESSION['profile']["urlPhoto"] ;?> width="40px" height="40px">
      <label class="h5 mr-3 text-capitalize"><?= $_SESSION['type'].": ".$_SESSION['profile']['genre'].". ".$_SESSION['profile']['prenom']." ".$_SESSION['profile']['nom']?></label>
      <input type="hidden" class="form-control" name="controle" value="connection">
      <button type="submit" class="btn btn-danger shadow-sm my-2 my-sm-0" name="action" value="disconnect">Déconnexion</button>
    </form>
  </div>
</nav>