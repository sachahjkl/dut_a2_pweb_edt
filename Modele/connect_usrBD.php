<?php
function check_profile($login,$pwd,&$profil,$type){
	require('./Modele/connectBD.php'); //$pdo est défini dans ce fichier
	$sql = "";
	if($type == "etu"){
		$sql="SELECT id_etu, id_promo, id_grpe, genre, nom, prenom, email, login_etu, MD5(pass_etu) as pass_etu, matricule, date_etu, urlPhoto FROM `etudiant`  where login_etu=:login and MD5(pass_etu)= MD5(:pwd)";
	}elseif($type == "prof"){
		$sql="SELECT id_prof, genre, nom, prenom, email, label, login_prof, MD5(pass_prof) as pass_prof, date_prof, urlPhoto, couleur FROM `prof`  where login_prof=:login and MD5(pass_prof)=MD5(:pwd)";
	}else{
		return false;
	}
	try {
		$commande = $pdo->prepare($sql);
		$commande->bindParam(':login', $login);
		$commande->bindParam(':pwd', $pwd);
		$bool = $commande->execute();
		$resultat = array();
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
			$profil = array();
			return false;
		}
		else {
			$profil = $resultat[0];
			return true;
		}
	}
function connectBD($profil){
	require('./Modele/connectBD.php');
	$sql = "";
	$type = $_SESSION['type'];
	if($type == "etu"){
		$sql="UPDATE etudiant SET bConnect = 1 WHERE id_etu =:id";
	}elseif($type == "prof"){
		$sql="UPDATE prof SET bConnect = 1 WHERE id_prof =:id";
	}
	try {
		$commande = $pdo->prepare($sql);
		$commande->bindParam(':id', $_SESSION['profil']['id_'.$type]);
		$bool = $commande->execute();
	} catch (PDOException $e) {
		echo utf8_encode("Echec de update : " . $e->getMessage() . "\n");
			die(); // On arrête tout.
	}
}
function disconnectBD($profil){
	require('./Modele/connectBD.php');
	$sql = "";
	$type = $_SESSION['type'];
	if($type == "etu"){
		$sql="UPDATE etudiant SET bConnect = 0 WHERE id_etu =:id";
	}elseif($type == "prof"){
		$sql="UPDATE prof SET bConnect = 0 WHERE id_prof =:id";
	}
	try {
		$commande = $pdo->prepare($sql);
		$commande->bindParam(':id', $_SESSION['profil']['id_'.$type]);
		$bool = $commande->execute();
	} catch (PDOException $e) {
		echo utf8_encode("Echec de update : " . $e->getMessage() . "\n");
			die(); // On arrête tout.
	}
}