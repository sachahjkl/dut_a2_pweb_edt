<?php

function getEDTHS(&$edth)
{
    require './model/connectBD.php';
    $sql = 'SELECT DISTINCT * FROM edth ORDER BY id_edth ASC';
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
    $edth = $resultat;
}
function getCreneaux($idEDTH, $idEtu)
{
    require './model/connectBD.php';
    $sql = "SELECT C.tDeb, C.tFin,P.label as pLabel, P.couleur, M.label as mLabel, S.label as sLabel, S.type_salle as sType, G.num_grpe
    		FROM creneau C, prof P, matiere M, salle S, groupe G
    		WHERE C.id_edth = :idEDTH AND C.id_grpe = G.id_grpe AND G.id_grpe IN (SELECT id_grpe FROM etu_grps EG WHERE EG.id_etu=:idEtu)
    		AND C.id_mat = M.id_mat AND C.id_prof = P.id_prof AND C.id_salle = S.id_salle
     		ORDER BY C.tDeb ASC";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':idEDTH', $idEDTH);
        $commande->bindParam(':idEtu', $idEtu);
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
