<?php

function load()
{
    $subaction = isset($_SESSION['subaction']) ? $_SESSION['subaction'] : 'EDTH';
    if (!isset($_SESSION["profile"])) {
        header('Location:./index.php');
    } else {
        require './model/professeur.php';
        $_SESSION['responsable'] = loadRole($_SESSION["profile"]["id_prof"], $roles);
        if ($_SESSION['responsable']) {
            $_SESSION["roles"] = $roles;
        }
        ("load" . $subaction)();
    }
}

function loadEDTH()
{

    // var_dump($_SESSION);
    $chemin = './view/professeur/edth.tpl';
    require './view/layout.tpl';
}
