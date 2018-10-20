<?php
header('content-type: text/html; charset=utf-8');
function login() {
    $type  = "etudiant";
    $util  = "étudiant";
    $login = "";
    $msg   = "";
    require "./view/connection/connect_usr.tpl";
}

function connect() {
    if (isset($_SESSION["profile"])) {
        header("Location=./index?controle=" . $_SESSION['userType'] . "&action=loadDashboard");
    }

    $login = isset($_POST["login"]) ? ($_POST["login"]) : "";
    $pwd   = isset($_POST["pwd"]) ? ($_POST["pwd"]) : "";
    $type  = "etudiant";
    $util  = "étudiant";
    if ($login == "" && $pwd == "") {
        header("Location:./index.php?controle=etudiant&action=login");
    } else {
        $profile = array();
        require "./model/connectUsrBD.php";
        if (!connectEtu($login, $pwd, $profile)) {
            $msg = "<div class='alert alert-danger mt-3' role='alert'>Identifiants incorrects. Veuillez reéssayer.</div>";
            require "./view/connection/connect_usr.tpl";
        } else {
            $_SESSION["profile"]  = $profile;
            $_SESSION["userType"] = $type;
            header("Location:./index.php?controle=etudiant&action=loadDashboard");
        }
    }
}

function loadDashboard() {
    //if(!isset)
    require "./model/connectUsrBD.php";
    $Default_Week = "6";
    $Default_EDTH = "6";
    getEDTH($edth);
    //getCreneaux();
    var_dump($edth);
    var_dump($_SESSION["profile"]);
    session_destroy();die();
}
