<?php
function getCreneau($id_usr,$id_edth,$type,&$creneau){ //Id_grp si étudiant et IdProf si prof
	require('./Modele/connectBD.php'); //$pdo est défini dans ce fichier
	$sql="";
	if($type == "etu"){
		$sql = "SELECT DISTINCT C.tDeb, C.tFin, M.label,M.couleur, P.label, S.nom FROM CRENEAU C, PROF P, MATIERE M, EDTH E, SALLE S WHERE C.id_edth = :id_edth AND C.id_grpe=:id_usr AND C.id_prof=P.id_prof AND C.id_mat=M.id_mat AND C.id_salle=S.id_salle";
	}elseif($type == "prof"){
		$sql = "SELECT DISTINCT C.tDeb, C.tFin, M.label, M.couleur, S.nom, G.num_grpe FROM CRENEAU C, PROF P, MATIERE M, EDTH E, SALLE S, GROUPE G WHERE C.id_edth = :id_edth AND C.id_prof=:id_usr AND C.id_mat=M.id_mat AND C.id_salle=S.id_salle AND C.id_grpe = G.id_grpe";
	}else{
		return false;
	}
	try {
		$commande = $pdo->prepare($sql);
		$commande->bindParam(':id_edth', $id_edth);
		$commande->bindParam(':id_usr', $id_usr);
		$bool = $commande->execute();
		$crenau = array();
		if ($bool) {
				$resultat = $commande->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
				//var_dump($resultat); die();
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die(); // On arrête tout.
		}
		if (count($resultat)== 0) {
			$creneau = array();
			return false; 
		}
		else {
			$creneau = $resultat[0];
			return true;
		}
}

  ?>