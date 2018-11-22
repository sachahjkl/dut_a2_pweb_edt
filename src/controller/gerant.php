<?php

function load()
{
    $subaction = isset($_GET['subaction']) ? $_GET['subaction'] : 'AjoutCreneaux';
    if (!isset($_SESSION["profile"]) || $_SESSION["type"] != "professeur" || !isset($_SESSION['profile']['roles']) || !$_SESSION['profile']['gerant']) {
        header('Location:./index.php');
    } else {
        $func = "load" . $subaction;
        $func();
    }
}

function loadCreneaux()
{
    require './model/gerant.php';
    require './model/professeur.php';
    getAllMatiere($mats);
    getSalles($salles);
    for ($i = 0; $i < count($mats); $i++) {
        $mats[$i]["creneaux"] = getAllCreneaux($mats[$i]['id_mat']);
    }
    $chemin = './view/gerant/gestionCreneaux.tpl';
    require './view/layout.tpl';
}

function loadMajLabel()
{
    require './model/professeur_resp.php';

    updateLabel($_GET['id_mat'], $_GET['newLabel']);
    header('Location:./index.php?controle=gerant&action=load&subaction=Creneaux');
}
