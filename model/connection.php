<?php

function connectEtu($login, $pwd, &$profile)
{
    require './model/connectBD.php';
    $sql = 'SELECT id_etu, id_promo, id_grpe, genre, nom, prenom, email, login_etu, MD5(pass_etu) as pass_etu, matricule, date_etu, urlPhoto FROM etudiant  where login_etu=:login and MD5(pass_etu)= MD5(:pwd)';
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

function connectProf($login, $pwd, &$profile)
{
    require './model/connectBD.php';
    $sql = 'SELECT id_prof, genre, nom, prenom, email, label, login_prof, MD5(pass_prof) as pass_prof, date_prof, urlPhoto, couleur FROM prof where login_prof=:login and MD5(pass_prof)=MD5(:pwd)';
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
