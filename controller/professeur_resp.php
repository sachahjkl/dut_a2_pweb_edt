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

    $chemin = './view/professeur_resp/gestionCreneaux.tpl';
    require './view/layout.tpl';
}
