<?php
header('content-type: text/html; charset=utf-8');
require "./model/connectBD.php";

function envoyer($idUsrSrc, $idUsrDest, string $msg)
{
    global $pdo;
    $sql = "INSERT INTO message (typeMsg, id_src, id_dest, contenu) VALUES (1,:id_etu_src,:id_etu_dest,:msg)";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':id_etu_src', $idUsrSrc);
        $commande->bindParam(':id_etu_dest', $idUsrDest);
        $commande->bindParam(':msg', $msg);
        $bool = $commande->execute();
        var_dump($bool, $msg, $idUsrSrc, $idUsrDest);
    } catch (PDOException $e) {
        echo utf8_encode("Echec de la requête: " . $e->getMessage() . "\n");
        die(); // On arrête tout.
    }
}

function recupererMessages($id_src, $id_dest)
{
    global $pdo;
    $sql = "SELECT distinct id_msg, id_src, id_dest, contenu,e.nom,e.prenom FROM message m,etudiant e WHERE m.typeMsg=1 AND (m.id_src=:id_src OR m.id_dest=:id_src) AND (m.id_dest=:id_dest OR m.id_src =:id_dest )  AND id_dest=e.id_etu ORDER BY m.id_msg ASC";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':id_src', $id_src);
        $commande->bindParam(':id_dest', $id_dest);
        $bool = $commande->execute();
        $resultat = array();
        if ($bool) {
            $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
            return $resultat;
        }
    } catch (PDOException $e) {
        echo utf8_encode("Echec de la requête: " . $e->getMessage() . "\n");
        die(); // On arrête tout.
    }
}

function EtuConnected($id_etud)
{
    global $pdo;
    $sql = "SELECT * FROM `etudiant` WHERE  id_etu<>:id_etu AND bConnect=1";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':id_etu', $id_etud);
        $bool = $commande->execute();
        $resultat = array();
        if ($bool) {
            $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
            return $resultat;
        }
    } catch (PDOException $e) {
        echo utf8_encode("Echec de la requête: " . $e->getMessage() . "\n");
        die(); // On arrête tout.
    }
}
