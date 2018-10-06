<?php
function check_profile($login,$pwd,&$profil){
	require('./Modele/connectBD.php'); //$pdo est défini dans ce fichier
	$sql="SELECT * FROM `professeur`  where login_prof=:login and pass_prof=:pwd";
	try {
		$commande = $pdo->prepare($sql);
		$commande->bindParam(':login', $login);
		$commande->bindParam(':pwd', $pwd);
		$bool = $commande->execute();
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
