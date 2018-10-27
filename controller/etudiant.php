<?php

function load()
{
    $subaction = isset($_GET['subaction']) ? $_GET['subaction'] : 'EDTH';
    if (!isset($_SESSION["profile"])) {
        header('Location:./index.php');
    } else {
        ("load" . $subaction)();
    }

}

function loadEDTH()
{
    $selectedEDTH = isset($_GET["selectedEDTH"]) ? $_GET["selectedEDTH"] : 6;
    require './model/etudiant.php';
    getEDTHS($edth);
    $edthN    = $edth[$selectedEDTH - 1];
    $crenaux  = getCreneaux($selectedEDTH, $_SESSION['profile']['id_etu']);
    $lundi    = array();
    $mardi    = array();
    $mercredi = array();
    $jeudi    = array();
    $vendredi = array();
    foreach ($crenaux as $v) {
        switch (date("N", $v["tDeb"])) {
            case 1:
                $lundi[] = $v;
                break;
            case 2:
                $mardi[] = $v;
                break;
            case 3:
                $mercredi[] = $v;
                break;
            case 4:
                $jeudi[] = $v;
                break;
            case 5:
                $vendredi[] = $v;
                break;
            default:
                break;
        }
    }
    $chemin = './view/etudiant/edth.tpl';
    require './view/layout.tpl';
}

function loadListProf()
{
    $chemin = './view/etudiant/listProf.tpl';
    require './view/layout.tpl';
}

function loadParamUtil()
{
    $chemin = './view/etudiant/paramUtil.tpl';
    require './view/layout.tpl';
}
