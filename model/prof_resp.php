<?php

function loadRole($idProf, &$roles)
{
    require './model/connectBD.php';
    $sql = 'SELECT * FROM prof_roles WHERE id_prof=:idProf AND bResp=1';
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


function getEDTHS(&$edth)
{
    require './model/connectBD.php';
    $sql = 'SELECT DISTINCT * FROM edth WHERE bCourant = 1 ORDER BY id_edth ASC';
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
function getCreneaux($idEDTH, $idProf)
{
    require './model/connectBD.php';
    $sql = "SELECT C.tDeb, C.tFin,P.label as pLabel, P.couleur, M.label as mLabel, S.label as sLabel, S.type_salle as sType, G.num_grpe
            FROM creneau C, prof P, matiere M, salle S, groupe G
            WHERE C.id_edth = :idEDTH AND C.id_grpe = G.id_grpe AND P.id_prof=:idProf
            AND C.id_mat = M.id_mat AND C.id_prof = P.id_prof AND C.id_salle = S.id_salle
            ORDER BY C.tDeb ASC";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':idEDTH', $idEDTH);
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
    return $resultat;
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



function updateLabel($idProf,$label){
     require './model/connectBD.php';
    $sql = "UPDATE matiere,prof_roles SET matiere.label=:label WHERE prof_roles.bResp=1 AND matiere.id_mat=prof_roles.id_objet AND prof_roles.id_prof=:idProf";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':label', $label);
        $commande->bindParam(':idProf', $idProf);
        $bool = $commande->execute();
    } catch (PDOException $e) {
        echo utf8_encode('Echec de la requête: ' . $e->getMessage() . '\n');
        die(); // On arrête tout.
    }
    return $bool;
}
