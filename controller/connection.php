<?php

function login()
{
    if (isset($_SESSION["profile"])) {
        header('Location:./index.php?controle=' . $_SESSION['type'] . '&action=load');
    }

    $login   = isset($_POST['login']) ? ($_POST['login']) : '';
    $pwd     = isset($_POST['pwd']) ? ($_POST['pwd']) : '';
    $profile = array();
    $msg     = "";

    if ($login == '' & $pwd == '') {
        $chemin = './view/connection/connect.tpl';
        require './view/layout.tpl';
    } else {
        require './model/connection.php';
        if (connectEtu($login, $pwd, $profile)) {
            unset($_SESSION["profile"]);
            $_SESSION["profile"] = $profile;
            $_SESSION["type"]    = 'etudiant';
            setBConnectEtu($profile['id_etu'], 1);
            header("Location:./index.php?controle=etudiant&action=load");
        } elseif (connectProf($login, $pwd, $profile)) {
            unset($_SESSION["profile"]);
            $_SESSION["profile"] = $profile;
            $_SESSION["type"]    = 'professeur';
            setBConnectProf($profile['id_prof'], 1);
            header("Location:./index.php?controle=professeur&action=load");
        } else {
            $msg    = "<div class='alert alert-danger mt-3' role='alert'>Identifiants incorrects. Veuillez reéssayer.</div>";
            $chemin = './view/connection/connect.tpl';
            require './view/layout.tpl';
        }
    }
}

function disconnect()
{
    require './model/connection.php';
    if ($_SESSION['type'] == 'etudiant') {
        setBConnectEtu($_SESSION['profile']['id_etu'], 0);
    } elseif ($_SESSION['type'] == 'professeur') {
        setBConnectProf($_SESSION['profile']['id_prof'], 0);
    }
    session_destroy();
    header('Location:./index.php');
}
