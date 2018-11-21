<?php

function getAllCreneaux($idMat)
{
    require './model/connectBD.php';
    $sql = "SELECT C.id_creneau, C.id_salle, C.id_grpe, C.id_edth, C.tDeb, C.tFin
    		FROM creneau C
    		WHERE C.id_mat=:idMat
            ORDER BY C.tDeb ASC";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':idMat', $idMat);
        $bool     = $commande->execute();
        $resultat = array();
        if ($bool) {
            $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
        }
    } catch (PDOException $e) {
        echo utf8_encode('Echec de la requête: ' . $e->getMessage() . '\n');
        die(); // On arrête tout.
    }
    return $resultat;
}

function getSalles(&$salles)
{
    require './model/connectBD.php';
    $sql = "SELECT * FROM salle ORDER BY C.tDeb ASC";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':idMat', $idMat);
        $bool     = $commande->execute();
        $resultat = array();
        if ($bool) {
            $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
        }
    } catch (PDOException $e) {
        echo utf8_encode('Echec de la requête: ' . $e->getMessage() . '\n');
        die(); // On arrête tout.
    }
    return $bool;
}

function updateLabel($idMat, $newLabel)
{
    require './model/connectBD.php';
    $sql = "UPDATE matiere SET label=:newLabel WHERE id_mat=:idMat";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':idMat', $idMat);
        $commande->bindParam(':newLabel', $newLabel);
        $bool = $commande->execute();
    } catch (PDOException $e) {
        echo utf8_encode('Echec de la requête: ' . $e->getMessage() . '\n');
        die(); // On arrête tout.
    }
    return $bool;
}
