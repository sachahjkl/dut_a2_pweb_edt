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

function getIdEDTH(&$edth) {
    global $pdo;
    $sql = "SELECT DISTINCT id_edth, label FROM edth ORDER BY tdeb ASC;";
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
    $edth = $resultat;
}

function getMatieres(&$m) {
    global $pdo;
    $sql = "SELECT DISTINCT id_mat, label FROM matiere ORDER BY id_mat ASC;";
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
    $m = $resultat;
}

function getProfs(&$p) {
    global $pdo;
    $sql = "SELECT DISTINCT id_prof, label FROM prof ORDER BY id_prof ASC;";
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
    $p = $resultat;
}

function getGroupes(&$g) {
    global $pdo;
    $sql = "SELECT DISTINCT id_grpe, num_grpe FROM groupe WHERE type_grpe ='mono' ORDER BY id_grpe ASC;";
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
    $g = $resultat;
}

function getCreneaux($id_Edth, $a) {

}
