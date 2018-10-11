<?php

function choix (){
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

if  (!isset($_POST['login']) && !isset($_POST['pwd']))
	require('./Vue/choix_type_util/connect_'.$type.'.tpl');
else {
//	$login =$_POST['login'];
//	$pwd=$_POST['pwd'];
		$profil = array(); //profil affecté par l'appel à verif_ident
		require('./Modele/connect_'.$type.'BD.php') ;
		if  (!check_profile($login,$pwd,$profil)) {
			$msg ="erreur de saisie.";
			require('./Vue/choix_type_util/connect_'.$type.'.tpl');
		}
		else  { 
			$_SESSION['profil']= $profil; //variable session 'profil' pour l'utilisateur connecté
			$id = $_SESSION['profil']['id_'.$type];  //idem ici :  $id = $profil['id_login']
			$msg = "Connexion réussie.";
			require('./Vue/choix_type_util/connect_'.$type.'.tpl');
		}
	}

}