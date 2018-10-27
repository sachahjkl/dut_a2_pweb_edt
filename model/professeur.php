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
