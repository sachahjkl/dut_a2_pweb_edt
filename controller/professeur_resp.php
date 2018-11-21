<?php

function load()
{
    $subaction = isset($_GET['subaction']) ? $_GET['subaction'] : 'AjoutCreneaux';
    if (!isset($_SESSION["profile"]) || $_SESSION["type"] != "professeur" || !isset($_SESSION['profile']['roles']) || $_SESSION['profile']['gerant']) {
        header('Location:./index.php');
    } else {
        $func = "load" . $subaction;
        $func();
    }
}

function loadCreneaux()
{
    require './model/professeur_resp.php';
    require './model/professeur.php';
    loadRoleResp($_SESSION['profile']['id_prof'], $roles);
    $_SESSION['profile']['roles'] = $roles;
    getSalles($salles);
    for ($i = 0; $i < count($roles); $i++) {
        $roles[$i]["creneaux"] = getAllCreneaux($roles[$i]['id_mat']);
    }
    $chemin = './view/professeur_resp/gestionCreneaux.tpl';
    require './view/layout.tpl';
}

function loadMajLabel()
{
    require './model/professeur_resp.php';
    updateLabel($_GET['id_mat'], $_GET['newLabel']);
    header('Location:./index.php?controle=professeur_resp&action=load&subaction=Creneaux');
}
