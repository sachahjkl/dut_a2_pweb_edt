<?php
function check_profile($login,$pwd,&$profil,$type){
	require('./Modele/connectBD.php'); //$pdo est défini dans ce fichier
	$sql = "";
	if($type == "etu"){
		$sql="SELECT * FROM `etudiant`  where login_etu=:login and pass_etu=:pwd";
	}elseif($type == "prof"){
		$sql="SELECT id_prof, genre, nom, prenom, email, label, login_prof, date_prof, urlPhoto, couleur, bConnect FROM `prof`  where login_prof=:login and pass_prof=:pwd";
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