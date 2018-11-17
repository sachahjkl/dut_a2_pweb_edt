<?php

function load()
{
    $subaction = isset($_GET['subaction']) ? $_GET['subaction'] : 'EDTH';
    if (!isset($_SESSION["profile"])) {
        header('Location:./index.php');
    } else {
        $func = "load" . $subaction;
        $func();
    }
}

function loadEDTH()
{
    $DEFAULT_EDTH         = 6;
    $_GET["selectedEDTH"] = isset($_GET["selectedEDTH"]) ? $_GET["selectedEDTH"] : $DEFAULT_EDTH;
    $nSelectedEDTH        = $_GET["selectedEDTH"];
    require './model/professeur.php';
    getEDTHS($edth);
    foreach ($edth as $e) {
        if ($e['id_edth'] == $nSelectedEDTH) {
            $edthSelected = $e;
            break;
        }
}
    $crenaux  = getCreneaux($nSelectedEDTH, $_SESSION['profile']['id_prof']);
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
    $chemin = './view/professeur/edth.tpl';
    require './view/layout.tpl';
}

function loadParamUtil()
{
    $msgUpload = isset($_SESSION["msgUpload"]) ? $_SESSION["msgUpload"] : "";
    $msgPwd    = isset($_SESSION["msgPwd"]) ? $_SESSION["msgPwd"] : "";
    unset($_SESSION["msgUpload"]);
    require './model/professeur.php';
    getColors($colorsTaken);
    $chemin = './view/professeur/paramUtil.tpl';
    require './view/layout.tpl';
}

function loadNewPicture()
{
    $target_dir    = "./userdata/profile_pictures/";
    $target_file   = $target_dir . $_SESSION['profile']['login_prof'] . "_" . date("Y_m_d_H_i_s") . "." . pathinfo($_FILES["newPP"]["name"], PATHINFO_EXTENSION);
    $uploadOk      = 1;
    $msg           = "";
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
// Check if image file is a actual image or fake image
    if (isset($_POST["submit"])) {
        $check = getimagesize($_FILES["newPP"]["tmp_name"]);
        if ($check !== false) {
            $uploadOk = 1;
        } else {
            $msg      = "Le fichier n'est pas une image.";
            $uploadOk = 0;
        }
    }
    if ($_FILES["newPP"]["tmp_name"] == "") {
        $msg      = "Veuillez choisir un fichier avant d'envoyer.";
        $uploadOk = 0;
    } else if ($_FILES["newPP"]["size"] > ((int) (ini_get('upload_max_filesize')) * 1000000)) {
        $msg      = "Désolé, le volume est trop volumineux.";
        $uploadOk = 0;
    } else if ($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
        && $imageFileType != "gif") {
        $msg      = "Désolé, seulement les fichiers de type JPG, JPEG, PNG & GIF sont autorisés.";
        $uploadOk = 0;
    } else if (move_uploaded_file($_FILES["newPP"]["tmp_name"], $target_file) && $uploadOk) {
        $msg = "Le fichier " . basename($_FILES["newPP"]["name"]) . " a été envoyé.";
        require './model/professeur.php';
        if (updatePicture($target_file, $_SESSION['profile']['id_prof'])) {
            $_SESSION['profile']['urlPhoto'] = $target_file;
        } else {
            $uploadOk = 0;
            $msg      = "Désolé, une erreur inconnue est survenue lors de l'envoi de l'image.";
        }
    }
    if ($uploadOk) {
        $_SESSION["msgUpload"] = "<div class='alert alert-success text-center mt-3 container mb-0' role='alert'>" . $msg . "</div>";
    } else {
        $_SESSION["msgUpload"] = "<div class='alert alert-danger text-center mt-3 container mb-0' role='alert'>" . $msg . "</div>";
    }
    header("Location:./index.php?controle=professeur&action=load&subaction=ParamUtil");
}

function loadNewPassword()
{
    $pwdNow   = md5($_POST["pwdNow"]);
    $pwdNew1  = md5($_POST["pwdNew1"]);
    $pwdNew2  = md5($_POST["pwdNew2"]);
    $msg      = "";
    $changeOK = 1;
    if ($pwdNow == "" || $pwdNew2 == "" || $pwdNew1 == "") {
        $msg      = "Veuillez remplir tous les champs.";
        $changeOK = 0;
    } else if ($pwdNow != $_SESSION['profile']['pass_prof']) {
        $msg      = "Vous n'avez pas saisi le bon mot de passe actuel";
        $changeOK = 0;
    } else if ($pwdNew1 != $pwdNew2) {
        $msg      = "Vos nouveaux mot de passe ne sont pas identiques.";
        $changeOK = 0;
    } else if (strlen($pwdNew1) < 4) {
        $msg      = "Votre nouveau mot de passe est trop court (4 caractères minimum)";
        $changeOK = 0;
    } else if ($changeOK) {
        $msg = "Votre mot de passe a bien été mis à jour.";
        require './model/professeur.php';
        if (updatePwd($pwdNew1, $_SESSION['profile']['id_prof'])) {
            $_SESSION['profile']['pass_prof'] = $pwdNew1;
        } else {
            $changeOK = 0;
            $msg      = "Désolé, une erreur inconnue est survenue du changement de votre mot de passe.";
        }
    }
    if ($changeOK) {
        $_SESSION["msgPwd"] = "<div class='alert alert-success text-center mt-3 container mb-0' role='alert'>" . $msg . "</div>";
    } else {
        $_SESSION["msgPwd"] = "<div class='alert alert-danger text-center mt-3 container mb-0' role='alert'>" . $msg . "</div>";
    }
    header("Location:./index.php?controle=professeur&action=load&subaction=ParamUtil");
}

function loadUpdateColor()
{
    if (isset($_GET['newColor'])) {
        $newColor = '#' . $_GET['newColor'];
        require './model/professeur.php';
        if (updateColor($newColor, $_SESSION['profile']['id_prof'])) {
            $_SESSION['profile']['couleur'] = $newColor;
        }
    }
    header("Location:./index.php?controle=professeur&action=load&subaction=ParamUtil");
}

function loadListProf()
{
    $listProf = array();
    require './model/etudiant.php';
    getProfsRoles($profRoles);
    $chemin = './view/professeur/listProf.tpl';
    require './view/layout.tpl';
}

function loadEtudiant()
{
    $DEFAULT_GRP         = 1;
    $_GET['selectedGrp'] = isset($_GET['selectedGrp']) ? $_GET['selectedGrp'] : $DEFAULT_GRP;
    $grp                 = $_GET['selectedGrp'];
    require './model/professeur.php';
    getGrps($grps);
    getEtudiantsGrp($etusGrp, $grp);
    $chemin = './view/professeur/rechercheEtudiant.tpl';
    require './view/layout.tpl';
}
