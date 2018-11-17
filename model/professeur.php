<?php

function loadRole($idProf, &$roles)
{
    require './model/connectBD.php';
    $sql = 'SELECT * FROM prof_roles WHERE id_prof=:idProf';
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':idProf', $idProf);
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
        $roles = $resultat;
        return true;
    }
}

function updatePicture($filePath, $idProf)
{
    require './model/connectBD.php';
    $sql = "UPDATE prof SET urlPhoto=:filePath WHERE id_prof=:idProf";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':idProf', $idProf);
        $commande->bindParam(':filePath', $filePath);
        $bool = $commande->execute();
    } catch (PDOException $e) {
        echo utf8_encode('Echec de la requête: ' . $e->getMessage() . '\n');
        die(); // On arrête tout.
    }
    return $bool;
}

function updatePwd($pwd, $idProf)
{
    require './model/connectBD.php';
    $sql = "UPDATE professeur SET pass_prof=:pwd WHERE id_prof=:idProf";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':idProf', $idProf);
        $commande->bindParam(':pwd', $pwd);
        $bool = $commande->execute();
    } catch (PDOException $e) {
        echo utf8_encode('Echec de la requête: ' . $e->getMessage() . '\n');
        die(); // On arrête tout.
    }
    return $bool;
}

function getColors(&$colors)
{
    require './model/connectBD.php';
    $sql = "SELECT couleur FROM prof";
    try {
        $commande = $pdo->prepare($sql);
        $bool     = $commande->execute();
        $resultat = array();
        if ($bool) {
            $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
        }
    } catch (PDOException $e) {
        echo utf8_encode('Echec de la requête: ' . $e->getMessage() . '\n');
        die(); // On arrête tout.
    }
    $colors = $resultat;
    return $bool;
}

function updateColor($color, $idProf)
{
    require './model/connectBD.php';
    $sql = "UPDATE prof SET couleur=:color WHERE id_prof=:idProf";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':color', $color);
        $commande->bindParam(':idProf', $idProf);
        $bool = $commande->execute();
    } catch (PDOException $e) {
        echo utf8_encode('Echec de la requête: ' . $e->getMessage() . '\n');
        die(); // On arrête tout.
    }
    return $bool;
}

function getGrps(&$grps)
{
    require './model/connectBD.php';
    $sql = "SELECT id_grpe, num_grpe FROM groupe
    WHERE num_grpe NOT IN ('promo','1/2','2/2')
    ORDER BY id_grpe";
    try {
        $commande = $pdo->prepare($sql);
        $bool     = $commande->execute();
        $resultat = array();
        if ($bool) {
            $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
        }
    } catch (PDOException $e) {
        echo utf8_encode('Echec de la requête: ' . $e->getMessage() . '\n');
        die(); // On arrête tout.
    }
    $grps = $resultat;
    return $bool;
}

function getEtudiantsGrp(&$etusGrp, $grp)
{
    require './model/connectBD.php';
    $sql = "SELECT DISTINCT E.id_etu, G.num_grpe, E.genre, E.nom, E.prenom, E.email
            FROM (etudiant E INNER JOIN groupe G ON G.id_grpe = E.id_grpe) INNER JOIN etu_grps EG ON E.id_etu = EG.id_etu
            WHERE EG.id_grpe=:grp
            ORDER BY E.id_etu";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':grp', $grp);
        $bool     = $commande->execute();
        $resultat = array();
        if ($bool) {
            $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
        }
    } catch (PDOException $e) {
        echo utf8_encode('Echec de la requête: ' . $e->getMessage() . '\n');
        die(); // On arrête tout.
    }
    $etusGrp = $resultat;
    return $bool;
}
