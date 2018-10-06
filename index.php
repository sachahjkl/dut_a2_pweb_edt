<?php 

session_start ();

if ((count($_POST)!=0) && !(isset($_POST['controle']) && isset ($_POST['action'])))
			require ('./Vue/erreur404.tpl'); //cas d'un appel à index.php avec des paramètres incorrects	
else {

	if (count($_POST)==0){
		$controle = "choix_type_util";   //cas d'une personne non authentifiée
		$action=	"choix";		//ou d'un appel à index.php sans paramètre
	}
	else {
		if (isset($_POST['controle']) && isset ($_POST['action'])) {
			$controle = $_POST['controle'];   //cas d'un appel à index.php 
			$action = 	 $_POST['action'];	//avec les 2 paramètres controle et action
		}
	}
//echo ('controle : ' . $controle . ' et <br/> action : ' . $action);	
require ('./Controle/' . $controle . '.php');
$action ();

} 

