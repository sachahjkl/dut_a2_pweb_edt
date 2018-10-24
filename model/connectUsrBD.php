<?php
header('content-type: text/html; charset=utf-8');
require "./model/connectBD.php";

function connectEtu($login, $pwd, &$profile) {
    global $pdo;
    $sql = "SELECT id_etu, id_promo, id_grpe, genre, nom, prenom, email, login_etu, MD5(pass_etu) as pass_etu, matricule, date_etu, urlPhoto FROM etudiant  where login_etu=:login and MD5(pass_etu)= MD5(:pwd)";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':login', $login);
        $commande->bindParam(':pwd', $pwd);
        $bool     = $commande->execute();
        $resultat = array();
        if ($bool) {
            $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
        }

    } catch (PDOException $e) {
        echo utf8_encode("Echec de la requête: " . $e->getMessage() . "\n");
        die(); // On arrête tout.
    }
    if (count($resultat) == 0) {
        return false;
    } else {
        $profile = $resultat[0];
        return true;
    }
}

function connectProf($login, $pwd, &$profile) {
    global $pdo;
    $sql = "SELECT id_prof, genre, nom, prenom, email, label, login_prof, MD5(pass_prof) as pass_prof, date_prof, urlPhoto, couleur FROM prof where login_prof=:login and MD5(pass_prof)=MD5(:pwd)";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':login', $login);
        $commande->bindParam(':pwd', $pwd);
        $bool     = $commande->execute();
        $resultat = array();
        if ($bool) {
            $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
        }

    } catch (PDOException $e) {
        echo utf8_encode("Echec de la requête: " . $e->getMessage() . "\n");
        die(); // On arrête tout.
    }
    if (count($resultat) == 0) {
        return false;
    } else {
        $profile = $resultat[0];
        return true;
    }
}

function estResponsable($idProf) {
    global $pdo;
    $sql = "SELECT bResp FROM prof_roles WHERE bResp = 1 and id_prof=:id;";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':id', $idProf);
        $bool     = $commande->execute();
        $resultat = array();
        if ($bool) {
            $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
        }

    } catch (PDOException $e) {
        echo utf8_encode("Echec de la requête: " . $e->getMessage() . "\n");
        die(); // On arrête tout.
    }
    if (count($resultat) == 0) {
        return false;
    } else {
        return true;
    }
}

function getEDTH(&$edth) {
    global $pdo;
    $sql = "SELECT DISTINCT * FROM edth ORDER BY tdeb ASC;";
    try {
        $commande = $pdo->prepare($sql);
        $bool     = $commande->execute();
        $resultat = array();
        if ($bool) {
            $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
        }

    } catch (PDOException $e) {
        echo utf8_encode("Echec de la requête: " . $e->getMessage() . "\n");
        die(); // On arrête tout.
    }
    for ($i = 0; $i < count($resultat); $i++) {
        $resultat[$i]["tDeb"] = date("D j-n-Y", $resultat[$i]["tDeb"] + 7200);
    }
    $edth = $resultat;
}

function getCreneaux($id_Edth, $a) {

}
