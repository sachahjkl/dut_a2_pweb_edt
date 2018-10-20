<?php
header('content-type: text/html; charset=utf-8');
function login() {
    $type  = "professeur";
    $util  = "professeur";
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
    $type  = "professeur";
    $util  = "professeur";
    if ($login == "" && $pwd == "") {
        header("Location:./index.php?controle=professeur&action=login");
    } else {
        $profile = array();
        require "./model/connectUsrBD.php";
        if (connectProf($login, $pwd, $profile)) {
            $_SESSION["profile"]  = $profile;
            $_SESSION["userType"] = $type;
            header("Location:./index.php?controle=professeur&action=loadDashboard");
        } else {
            $msg = "<div class='alert alert-danger mt-3' role='alert'>Identifiants incorrects. Veuillez reéssayer.</div>";
            require "./view/connection/connect_usr.tpl";
        }
    }
}

function loadDashboard() {
    var_dump($_SESSION["profile"]);
    session_destroy();die();
}
