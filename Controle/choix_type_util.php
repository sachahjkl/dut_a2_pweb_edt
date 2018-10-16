<?php
function choix (){
	if (isset($_SESSION['profil']) ) {
		header("Location:./index.php?controle=dashboard&action=load");
	}
	require("./Vue/choix_type_util/choix.tpl");
}
function connect_etu(){
	connect_any("etu");
}
function connect_prof(){
	connect_any("prof");
}
function connect_any($type){
$login= isset($_POST['login'])?($_POST['login']):''; //ident.tpl a une url paramétré
$pwd= isset($_POST['pwd'])?($_POST['pwd']):'';
$msg='';
if (isset($_SESSION['profil']) ) {
		header("Location:./index.php?controle=dashboard&action=load");
}
if($type == "etu")
	$nom_type = "étudiant";
if($type == "prof")
	$nom_type = "professeur";
if  ((!isset($_POST['login']) && !isset($_POST['pwd'] ))){
	require('./Vue/choix_type_util/connect_usr.tpl');
}
else{
		$profil = array(); //profil affecté par l'appel à verif_ident
		require('./Modele/connect_usrBD.php');
		if  (!check_profile($login,$pwd,$profil,$type)) {
			$msg ="erreur de saisie.";
			require('./Vue/choix_type_util/connect_usr.tpl');
		}
		else  {
			$_SESSION['profil']= $profil; //variable session 'profil' pour l'utilisateur connecté
			$_SESSION['type'] = $type;
			connectBD($_SESSION['profil']);
			$msg = "Connexion réussie.";
			header("Location:./index.php?controle=dashboard&action=load");
		}
	}
}
function disconnect(){
	require('./Modele/connect_usrBD.php');
	disconnectBD($_SESSION['profil']);
		echo "test";
	session_destroy();
	header("Location:./index.php");
}