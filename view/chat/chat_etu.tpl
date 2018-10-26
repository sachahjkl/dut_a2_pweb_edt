<!DOCTYPE html>
<html>
  <head>
    <title>Connexion d'un <?php echo $_SESSION["userType"]; ?></title>
    <meta charset='utf-8'>
    <link rel="stylesheet" href="./Bootstrap/css/bootstrap.min.css">
    <script src="./Bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="./view/style/all.css">
  </head>
  <body>
    <div class="container">
      <div class="container">
        <h2>Chat Messages</h2>

      <?php foreach ($messagesEchanges as $messages): ?>
      <?php if ($messages['id_src'] == $id_src): ?> 
      <div class="card">
        <div class="card-header">
          <img src="./userdata/images/user_default.jpg" alt="Avatar" style="height: 20px; width:20px">
          <?=$_SESSION["profile"]["prenom"] . " " . $_SESSION["profile"]["nom"];?>

        </div>
        <div class="card-body">
          <p><?=$messages["contenu"];?></p>
        </div>
      </div>
      <?php elseif ($messages['id_src'] == $id_dest): ?>
      <div class="card card-body inverse bg-dark text-white">
        <div class="card-header">
          <img src="./userdata/images/user_default.jpg" alt="Avatar" style="height: 20px; width:20px">
          <?=$messages["prenom"] . " " . $messages["nom"];?>
        </div>
        <div class="card-body">
          <p><?=$messages["contenu"];?></p>
        </div>
      </div>
      <?php endif;?>
      <?php endforeach;?>
      </div>
      <div class="container">
        <form action="index.php?controle=chat&action=envoyerMessage" method="post">
        <textarea class="form-text" name='msg' placeholder="tapez votre message ici"></textarea>
        <button class="btn btn-primary"type="sumbit">Envoyer</button>
      </form>
      </div>
    </div>
  </body>
</html>