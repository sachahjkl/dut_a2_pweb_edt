<?php

function connectEtu($login, $pwdMD5, &$profile)
{
    require './model/connectBD.php';
    $sql = 'SELECT E.id_etu, P.label as pLabel, F.nom as fNom, E.id_grpe, E.genre, E.nom, E.prenom, E.email, E.login_etu, E.pass_etu, E.matricule, E.date_etu, E.urlPhoto FROM (etudiant E INNER JOIN promotion P ON E.id_promo = P.id_promo) INNER JOIN formation F ON F.id_form = P.id_form where login_etu=:login and pass_etu= :pwd';
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':login', $login);
        $commande->bindParam(':pwd', $pwdMD5);
        $bool     = $commande->execute();
        $resultat = array();
        if ($bool) {
            $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
        }
    } catch (PDOException $e) {
        echo utf8_encode('Echec de la requête: ' . $e->getMessage() . '\n');
        die(); // On arrête tout.
    }
    if (count($resultat) == 0) {
        return false;
    } else {
        $profile = $resultat[0];
        return true;
    }
}

function connectProf($login, $pwdMD5, &$profile)
{
    require './model/connectBD.php';
    $sql = 'SELECT * FROM prof P INNER JOIN prof_roles PR ON PR.id_prof = P.id_prof where login_prof=:login and pass_prof=:pwd';
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':login', $login);
        $commande->bindParam(':pwd', $pwdMD5);
        $bool     = $commande->execute();
        $resultat = array();
        if ($bool) {
            $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
        }
    } catch (PDOException $e) {
        echo utf8_encode('Echec de la requête: ' . $e->getMessage() . '\n');
        die(); // On arrête tout.
    }
    if (count($resultat) == 0) {
        return false;
    } else {
        $profile = $resultat[0];
        return true;
    }
}

function setBConnectProf($idProf, $bconnect)
{
    require './model/connectBD.php';
    $bool = false;
    $sql  = 'UPDATE prof SET bConnect = :bconnect WHERE id_prof=:idProf';
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':bconnect', $bconnect);
        $commande->bindParam(':idProf', $idProf);
        $bool = $commande->execute();
    } catch (PDOException $e) {
        echo utf8_encode('Echec de la requête: ' . $e->getMessage() . '\n');
        die(); // On arrête tout.
    }
    return $bool;
}

function setBConnectEtu($idEtu, $bconnect)
{
    require './model/connectBD.php';
    $bool = false;
    $sql  = 'UPDATE etudiant SET bConnect = :bconnect WHERE id_etu=:idEtu';
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':bconnect', $bconnect);
        $commande->bindParam(':idEtu', $idEtu);
        $bool = $commande->execute();
    } catch (PDOException $e) {
        echo utf8_encode('Echec de la requête: ' . $e->getMessage() . '\n');
        die(); // On arrête tout.
    }
    return $bool;
}
