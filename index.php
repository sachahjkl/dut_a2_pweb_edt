<?php
setlocale(LC_ALL, 'fr_FR.utf8', 'fra');
header('content-type: text/html; charset=utf-8');
session_start();
if ((count($_GET) != 0) && (!isset($_GET['controle']) || !isset($_GET['action']))) {
    $errorMessage = 'Parametres incorrects.';
    require './view/other/404error.tpl';
}
//cas d'un appel à index.php avec des paramètres incorrects
else {

    if (count($_GET) == 0) {
        $controle = "connection"; //cas d'une personne non authentifiée
        $action   = "login"; //ou d'un appel à index.php sans paramètre
    } else {
        $controle = isset($_GET['controle']) ? $_GET['controle'] : ''; //cas d'un appel à index.php
        $action   = isset($_GET['action']) ? $_GET['action'] : ''; //avec les 2 paramètres controle et action

    }
    require './controller/' . $controle . '.php';
    $action();

}
